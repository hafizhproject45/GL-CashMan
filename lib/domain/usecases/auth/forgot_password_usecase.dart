import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../../repositories/auth/auth_repository.dart';

class ForgotPasswordUsecase implements UseCase<void, String> {
  final AuthRepository authRepository;

  ForgotPasswordUsecase({
    required this.authRepository,
  });

  @override
  Future<Either<Failure, void>> call(String params) async {
    Either<Failure, void> result = await authRepository.forgotPassword(params);

    return result.fold(
      (failure) => Left(failure),
      (value) => Right(value),
    );
  }
}
