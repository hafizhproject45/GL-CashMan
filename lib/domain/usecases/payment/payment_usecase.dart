import 'package:dartz/dartz.dart';

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

    final getName = await authRepository.getRemoteUserData(userID);

    late String name;

    getName.fold(
      (l) => l,
      (r) => name = '${r.fullname}-${r.block}',
    );

    final newPayment = PaymentEntity(
      userId: userID,
      paymentDate: params.paymentDate,
      createdAt: DateTime.now().toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
    );

    final result = await paymentRepository.payment(newPayment, name);

    return result.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }
}
