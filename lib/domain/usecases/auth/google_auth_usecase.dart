import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../../repositories/auth/auth_repository.dart';

class GoogleAuthUsecase implements UseCase<void, NoParams> {
  final AuthRepository authRepository;

  GoogleAuthUsecase({
    required this.authRepository,
  });

  @override
  Future<Either<Failure, void>> call(NoParams noParams) async {
    Either<Failure, void> result = await authRepository.googleAuth();

    return result.fold(
      (failure) => Left(failure),
      (value) => Right(value),
    );
  }
}
