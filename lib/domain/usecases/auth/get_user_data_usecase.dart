import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../../entities/auth/user_entity.dart';
import '../../repositories/auth/auth_repository.dart';

class GetUserDataUsecase implements UseCase<List<UserEntity>, String> {
  final AuthRepository authRepository;

  GetUserDataUsecase({
    required this.authRepository,
  });

  @override
  Future<Either<Failure, List<UserEntity>>> call(String params) async {
    Either<Failure, List<UserEntity>> result =
        await authRepository.getRemoteUserData(params);

    return result.fold(
      (failure) => Left(failure),
      (value) => Right(value),
    );
  }
}
