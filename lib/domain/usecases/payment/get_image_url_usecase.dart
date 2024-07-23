import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../../repositories/auth/auth_repository.dart';
import '../../repositories/payment/payment_repository.dart';

class GetImageUrlUsecase implements UseCase<String, NoParams> {
  final PaymentRepository paymentRepository;
  final AuthRepository authRepository;

  GetImageUrlUsecase({
    required this.paymentRepository,
    required this.authRepository,
  });

  @override
  Future<Either<Failure, String>> call(NoParams noParams) async {
    final getId = await authRepository.getUserID();

    late int userID;

    getId.fold(
      (l) => l,
      (r) => userID = r,
    );

    final loginDataRequest = await authRepository.getRemoteUserData(userID);

    late String userEmail;

    loginDataRequest.fold(
      (l) => l,
      (r) => userEmail = r.email,
    );

    final result = await paymentRepository.getImageUrl(userEmail);

    return result.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }
}
