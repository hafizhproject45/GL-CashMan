import 'package:dartz/dartz.dart';
import '../../entities/payment/payment_entity.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../../repositories/auth/auth_repository.dart';
import '../../repositories/payment/payment_repository.dart';

class GetPaymentUsecase implements UseCase<List<PaymentEntity>, NoParams> {
  final PaymentRepository paymentRepository;
  final AuthRepository authRepository;

  GetPaymentUsecase({
    required this.paymentRepository,
    required this.authRepository,
  });

  @override
  Future<Either<Failure, List<PaymentEntity>>> call(NoParams noParams) async {
    final getId = await authRepository.getUserID();

    late int userID;

    getId.fold(
      (l) => l,
      (r) => userID = r,
    );

    final result = await paymentRepository.getPaymentByUserId(userID);

    return result.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }
}
