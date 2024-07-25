import 'package:dartz/dartz.dart';
import '../../../core/utils/utility.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../../entities/payment/payment_entity.dart';
import '../../repositories/auth/auth_repository.dart';
import '../../repositories/payment/payment_repository.dart';

class PaymentUsecase implements UseCase<void, PaymentEntity> {
  final PaymentRepository paymentRepository;
  final AuthRepository authRepository;

  PaymentUsecase({
    required this.paymentRepository,
    required this.authRepository,
  });

  @override
  Future<Either<Failure, void>> call(PaymentEntity params) async {
    final getId = await authRepository.getUserID();

    late int userID;

    getId.fold(
      (l) => l,
      (r) => userID = r,
    );

    final getEmail = await authRepository.getRemoteUserData(userID);

    late String email;

    getEmail.fold(
      (l) => l,
      (r) => email = r.email,
    );

    final newPayment = PaymentEntity(
      userId: userID,
      paymentDate: params.paymentDate,
      createdAt: Utility.formatDatePostApi(DateTime.now()),
      updatedAt: Utility.formatDatePostApi(DateTime.now()),
    );

    final result = await paymentRepository.payment(newPayment, email);

    return result.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }
}
