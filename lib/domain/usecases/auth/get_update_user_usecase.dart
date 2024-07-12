import 'package:dartz/dartz.dart';
import '../../entities/auth/update_request_entity.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../../repositories/auth/auth_repository.dart';

class GetUpdateUserUsecase implements UseCase<void, UpdateRequestEntity> {
  final AuthRepository authRepository;

  GetUpdateUserUsecase({
    required this.authRepository,
  });

  @override
  Future<Either<Failure, void>> call(UpdateRequestEntity params) async {
    Either<Failure, void> result = await authRepository.getUpdateUser(params);

    return result.fold(
      (failure) => Left(failure),
      (value) => Right(value),
    );
  }
}
