import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../../entities/user/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> checkLogin();
  Future<Either<Failure, void>> login(UserEntity request);
  Future<Either<Failure, void>> register(UserEntity request);
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, void>> googleAuth();
  Future<Either<Failure, void>> forgotPassword(String email);
  Future<Either<Failure, void>> getCreateCurrentUser(UserEntity request);
  Future<Either<Failure, void>> getUpdateUser(UserEntity request);
  Future<Either<Failure, String>> getCurrentUID();
  Future<Either<Failure, List<UserEntity>>> getUserData(UserEntity request);
}
