import 'package:dartz/dartz.dart';
import 'package:gl_app/domain/entities/auth/login_request_entity.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../../repositories/auth/auth_repository.dart';

class LoginUsecase implements UseCase<void, LoginRequestEntity> {
  final AuthRepository authRepository;

  LoginUsecase({
    required this.authRepository,
  });

  @override
  Future<Either<Failure, void>> call(LoginRequestEntity params) async {
    Either<Failure, void> result = await authRepository.login(params);

    return result.fold(
      (failure) => Left(failure),
      (value) => Right(value),
    );
  }
}
