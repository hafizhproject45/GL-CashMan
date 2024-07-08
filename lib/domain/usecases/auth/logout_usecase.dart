import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../../repositories/auth/auth_repository.dart';

class LogoutUsecase implements UseCase<void, NoParams> {
  final AuthRepository authRepository;

  LogoutUsecase({
    required this.authRepository,
  });

  @override
  Future<Either<Failure, void>> call(NoParams noParams) async {
    Either<Failure, void> result = await authRepository.logout();

    return result.fold(
      (failure) => Left(failure),
      (value) => Right(value),
    );
  }
}
