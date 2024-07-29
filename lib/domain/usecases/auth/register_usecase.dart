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
    final registerRequest = RegisterRequestEntity(
      fullname: params.fullname,
      block: params.block,
      email: params.email,
      phone: params.phone,
      password: params.password,
      createdAt: DateTime.now().toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
    );

    final result = await authRepository.register(registerRequest);

    return result.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }
}
