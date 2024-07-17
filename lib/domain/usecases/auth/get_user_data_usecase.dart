import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../../entities/auth/user_entity.dart';
import '../../repositories/auth/auth_repository.dart';

class GetUserDataUsecase implements UseCase<UserEntity, NoParams> {
  final AuthRepository authRepository;

  GetUserDataUsecase({
    required this.authRepository,
  });

  @override
  Future<Either<Failure, UserEntity>> call(NoParams params) async {
    final loginDataRequest = await authRepository.getUserID();

    late int userID;

    loginDataRequest.fold(
      (l) => Left(l),
      (r) => Right(userID = r),
    );

    final result = await authRepository.getRemoteUserData(userID);

    return result.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }
}
