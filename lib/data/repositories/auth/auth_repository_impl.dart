import 'package:dartz/dartz.dart';
import 'package:supabase/supabase.dart' as sb;

import '../../../core/errors/exceptions.dart';
import '../../../core/errors/failures.dart';
import '../../../domain/entities/auth/login_request_entity.dart';
import '../../../domain/entities/auth/register_request_entity.dart';
import '../../../domain/entities/auth/update_request_entity.dart';
import '../../../domain/entities/auth/user_entity.dart';
import '../../../domain/repositories/auth/auth_repository.dart';
import '../../datasources/auth/auth_local_datasource.dart';
import '../../datasources/auth/auth_remote_datasource.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDatasource authLocalDatasource;

  AuthRepositoryImpl({
    required this.authRemoteDataSource,
    required this.authLocalDatasource,
  });

  @override
  Future<Either<Failure, String>> getUserIDAuth() async {
    try {
      final data = await authRemoteDataSource.getUserIDAuth();

      return Right(data);
    } catch (e) {
      return Left(_handleException(e));
    }
  }

  @override
  Future<Either<Failure, int>> getUserID() async {
    try {
      final data = await authRemoteDataSource.getUserID();

      return Right(data);
    } catch (e) {
      return Left(_handleException(e));
    }
  }

  @override
  Future<Either<Failure, bool>> checkLogin() async {
    try {
      final data = await authRemoteDataSource.checkLogin();

      if (data) {
        return const Right(true);
      } else {
        return const Right(false);
      }
    } catch (e) {
      return Left(_handleException(e));
    }
  }

  @override
  Future<Either<Failure, void>> forgotPassword(String email) async {
    try {
      final data = await authRemoteDataSource.forgotPassword(email);

      return Right(data);
    } catch (e) {
      return Left(_handleException(e));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getRemoteUserData(int userId) async {
    try {
      final data = await authRemoteDataSource.getRemoteUserData(userId);

      return Right(data);
    } catch (e) {
      return Left(_handleException(e));
    }
  }

  @override
  Future<Either<Failure, void>> login(LoginRequestEntity request) async {
    try {
      final data = await authRemoteDataSource.login(request);
      return Right(data);
    } catch (e) {
      return Left(_handleException(e));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      final data = await authRemoteDataSource.logout();

      return Right(data);
    } catch (e) {
      return Left(_handleException(e));
    }
  }

  @override
  Future<Either<Failure, void>> register(RegisterRequestEntity request) async {
    try {
      final data = await authRemoteDataSource.register(request);

      return Right(data);
    } catch (e) {
      return Left(_handleException(e));
    }
  }

  @override
  Future<Either<Failure, void>> updateUser(UpdateRequestEntity request) async {
    try {
      final data = await authRemoteDataSource.updateUser(request);

      return Right(data);
    } catch (e) {
      return Left(_handleException(e));
    }
  }

  Failure _handleException(Object e) {
    if (e is sb.AuthException) {
      return ServerFailure(
        message: e.message == 'Invalid login credentials'
            ? 'Account not found'
            : e.message,
      );
    } else if (e is ServerException) {
      return const ServerFailure();
    } else {
      return const UnknownFailure();
    }
  }
}
