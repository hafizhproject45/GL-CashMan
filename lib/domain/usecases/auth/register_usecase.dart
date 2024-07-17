import 'package:dartz/dartz.dart';

import '../../entities/auth/register_request_entity.dart';
import '../../../core/errors/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../../repositories/auth/auth_repository.dart';

class RegisterUsecase implements UseCase<void, RegisterRequestEntity> {
  final AuthRepository authRepository;

  RegisterUsecase({
    required this.authRepository,
  });

  @override
  Future<Either<Failure, void>> call(RegisterRequestEntity params) async {
    final result = await authRepository.register(params);

    return result.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }
}
