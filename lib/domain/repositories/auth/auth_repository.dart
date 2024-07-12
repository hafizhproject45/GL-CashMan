import 'package:dartz/dartz.dart';
import '../../entities/auth/login_request_entity.dart';
import '../../entities/auth/register_request_entity.dart';
import '../../entities/auth/update_request_entity.dart';
import '../../../core/errors/failures.dart';
import '../../entities/auth/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> checkLogin();
  Future<Either<Failure, void>> login(LoginRequestEntity request);
  Future<Either<Failure, void>> register(RegisterRequestEntity request);
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, void>> googleAuth();
  Future<Either<Failure, void>> forgotPassword(String email);
  Future<Either<Failure, void>> getCreateCurrentUser(
      RegisterRequestEntity request);
  Future<Either<Failure, void>> getUpdateUser(UpdateRequestEntity request);
  Future<Either<Failure, String>> getCurrentUID();
  Future<Either<Failure, List<UserEntity>>> getRemoteUserData(String params);
}
