import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../../repositories/auth/auth_repository.dart';

class CheckLoginUsecase implements UseCase<bool, NoParams> {
  final AuthRepository authRepository;

  CheckLoginUsecase({
    required this.authRepository,
  });

  @override
  Future<Either<Failure, bool>> call(NoParams noParams) async {
    Either<Failure, bool> result = await authRepository.checkLogin();

    return result.fold(
      (failure) => Left(failure),
      (value) => Right(value),
    );
  }
}
