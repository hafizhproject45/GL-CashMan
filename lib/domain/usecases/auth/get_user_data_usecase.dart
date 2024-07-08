import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../../entities/user/user_entity.dart';
import '../../repositories/auth/auth_repository.dart';

class GetUserDataUsecase implements UseCase<List<UserEntity>, UserEntity> {
  final AuthRepository authRepository;

  GetUserDataUsecase({
    required this.authRepository,
  });

  @override
  Future<Either<Failure, List<UserEntity>>> call(UserEntity params) async {
    Either<Failure, List<UserEntity>> result =
        await authRepository.getUserData(params);

    return result.fold(
      (failure) => Left(failure),
      (value) => Right(value),
    );
  }
}
