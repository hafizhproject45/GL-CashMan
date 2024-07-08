// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/repositories/auth/auth_repository.dart';
import '../../../core/errors/exceptions.dart';
import '../../../core/errors/failures.dart';
import '../../../domain/entities/user/user_entity.dart';
import '../../datasources/auth/auth_remote_datasource.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({
    required this.authRemoteDataSource,
  });

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
  Future<Either<Failure, void>> getCreateCurrentUser(UserEntity request) async {
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
  Future<Either<Failure, void>> getUpdateUser(UserEntity request) async {
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
  Future<Either<Failure, bool>> checkLogin() async {
    try {
      final isLoggedIn = await authRemoteDataSource.checkLogin();
      return Right(isLoggedIn);
    } catch (e) {
      return Left(_handleException(e));
    }
  }

  @override
  Future<Either<Failure, void>> login(UserEntity request) async {
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
  Future<Either<Failure, void>> register(UserEntity request) async {
    try {
      await authRemoteDataSource.register(request);
      return const Right(null);
    } catch (e) {
      return Left(_handleException(e));
    }
  }

  @override
  Future<Either<Failure, List<UserEntity>>> getUserData(
      UserEntity request) async {
    try {
      final result = await authRemoteDataSource.getUserData(request);
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
