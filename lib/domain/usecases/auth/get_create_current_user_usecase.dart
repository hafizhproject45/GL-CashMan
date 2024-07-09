import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../../repositories/auth/auth_repository.dart';
import '../../entities/auth/register_request_entity.dart';

class GetCreateCurrentUserUsecase
    implements UseCase<void, RegisterRequestEntity> {
  final AuthRepository authRepository;

  GetCreateCurrentUserUsecase({
    required this.authRepository,
  });

  @override
  Future<Either<Failure, void>> call(RegisterRequestEntity params) async {
    Either<Failure, void> result =
        await authRepository.getCreateCurrentUser(params);

    return result.fold(
      (failure) => Left(failure),
      (value) => Right(value),
    );
  }
}
