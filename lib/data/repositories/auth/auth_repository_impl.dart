// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../datasources/auth/auth_local_datasource.dart';
import '../../../domain/entities/auth/login_request_entity.dart';
import '../../../domain/entities/auth/register_request_entity.dart';
import '../../../domain/entities/auth/update_request_entity.dart';
import '../../../core/errors/exceptions.dart';
import '../../../core/errors/failures.dart';
import '../../../core/utils/constants.dart';
import '../../../domain/entities/auth/user_entity.dart';
import '../../../domain/repositories/auth/auth_repository.dart';
import '../../datasources/auth/auth_remote_datasource.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDatasource authLocalDatasource;

  AuthRepositoryImpl({
    required this.authRemoteDataSource,
    required this.authLocalDatasource,
  });

  @override
  Future<Either<Failure, bool>> checkLogin() async {
    try {
      await authLocalDatasource.checkLogin();

      return const Right(true);
    } catch (e) {
      if (e is CacheException) {
        return Left(CacheFailure(message: e.message));
      } else {
        return const Left(UnknownFailure(message: FAILURE_UNKNOWN));
      }
    }
  }

  @override
  Future<Either<Failure, void>> forgotPassword(String email) async {
    try {
      await authRemoteDataSource.forgotPassword(email);
      return const Right(null);
    } catch (e) {
      return Left(_handleException(e));
    }
  }

  @override
  Future<Either<Failure, void>> getCreateCurrentUser(
      RegisterRequestEntity request) async {
    try {
      await authRemoteDataSource.getCreateCurrentUser(request);
      return const Right(null);
    } catch (e) {
      return Left(_handleException(e));
    }
  }

  @override
  Future<Either<Failure, String>> getCurrentUID() async {
    try {
      final uid = await authRemoteDataSource.getCurrentUID();
      return Right(uid);
    } catch (e) {
      return Left(_handleException(e));
    }
  }

  @override
  Future<Either<Failure, void>> getUpdateUser(
      UpdateRequestEntity request) async {
    try {
      await authRemoteDataSource.getUpdateUser(request);
      return const Right(null);
    } catch (e) {
      return Left(_handleException(e));
    }
  }

  @override
  Future<Either<Failure, void>> googleAuth() async {
    try {
      await authRemoteDataSource.googleAuth();
      return const Right(null);
    } catch (e) {
      return Left(_handleException(e));
    }
  }

  @override
  Future<Either<Failure, void>> login(LoginRequestEntity request) async {
    try {
      await authRemoteDataSource.login(request);
      return const Right(null);
    } catch (e) {
      return Left(_handleException(e));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await authRemoteDataSource.logout();
      return const Right(null);
    } catch (e) {
      return Left(_handleException(e));
    }
  }

  @override
  Future<Either<Failure, void>> register(RegisterRequestEntity request) async {
    try {
      await authRemoteDataSource.register(request);
      return const Right(null);
    } catch (e) {
      return Left(_handleException(e));
    }
  }

  @override
  Future<Either<Failure, List<UserEntity>>> getRemoteUserData(
      String params) async {
    try {
      final result = await authRemoteDataSource.getRemoteUserData(params);
      return Right(result);
    } catch (e) {
      return Left(_handleException(e));
    }
  }

  Failure _handleException(Object e) {
    if (e is FirebaseAuthException) {
      return ServerFailure(message: e.message ?? 'Unknown FirebaseAuth error');
    } else if (e is AuthException) {
      return ServerFailure(message: e.message);
    } else if (e is ServerException) {
      return const ServerFailure();
    } else {
      return const UnknownFailure();
    }
  }
}
