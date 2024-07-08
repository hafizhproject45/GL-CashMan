import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../../entities/user/user_entity.dart';
import '../../repositories/auth/auth_repository.dart';

class LoginUsecase implements UseCase<void, UserEntity> {
  final AuthRepository authRepository;

  LoginUsecase({
    required this.authRepository,
  });

  @override
  Future<Either<Failure, void>> call(UserEntity params) async {
    Either<Failure, void> result = await authRepository.login(params);

    return result.fold(
      (failure) => Left(failure),
      (value) => Right(value),
    );
  }
}
