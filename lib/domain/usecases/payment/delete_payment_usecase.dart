import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:gl_cashman/domain/repositories/auth/auth_repository.dart';
import '../../../core/errors/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../../repositories/payment/payment_repository.dart';

class DeletePaymentUsecase implements UseCase<void, int> {
  final PaymentRepository paymentRepository;
  final AuthRepository authRepository;

  DeletePaymentUsecase({
    required this.paymentRepository,
    required this.authRepository,
  });

  @override
  Future<Either<Failure, void>> call(int params) async {
    final getId = await authRepository.getUserID();
    int? userID;
    getId.fold(
      (l) => null,
      (r) => userID = r,
    );
    if (userID == null) {
      return const Left(ServerFailure(message: 'Failed to get user ID'));
    }

    final getEmail = await authRepository.getRemoteUserData(userID!);
    String? userEmail;
    getEmail.fold(
      (l) => null,
      (r) => userEmail = r.email,
    );
    if (userEmail == null) {
      return const Left(ServerFailure(message: 'Failed to get user email'));
    }

    final getImageUrl =
        await paymentRepository.getImageUrl(userEmail!, getImageUrl: false);
    String? imageUrl;
    getImageUrl.fold(
      (l) => null,
      (r) => imageUrl = r,
    );
    log('$imageUrl');
    if (imageUrl == null) {
      return const Left(ServerFailure(message: 'Failed to get image URL'));
    }

    final result = await paymentRepository.deletePayment(params, imageUrl!);
    return result.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }
}
