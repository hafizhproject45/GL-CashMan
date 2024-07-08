import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../../entities/user/user_entity.dart';
import '../../repositories/auth/auth_repository.dart';

class GetCreateCurrentUserUsecase implements UseCase<void, UserEntity> {
  final AuthRepository authRepository;

  GetCreateCurrentUserUsecase({
    required this.authRepository,
  });

  @override
  Future<Either<Failure, void>> call(UserEntity params) async {
    Either<Failure, void> result =
        await authRepository.getCreateCurrentUser(params);

    return result.fold(
      (failure) => Left(failure),
      (value) => Right(value),
    );
  }
}
