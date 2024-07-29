import 'package:dartz/dartz.dart';
import '../../entities/payment/payment_entity.dart';

import '../../../core/errors/failures.dart';

abstract class PaymentRepository {
  Future<Either<Failure, void>> payment(PaymentEntity request, String name);
  Future<Either<Failure, PaymentEntity>> getPayment(int paymentId);
  Future<Either<Failure, List<PaymentEntity>>> getPaymentByUserId(int userId);
  Future<Either<Failure, void>> deletePayment(int paymentId, String imageName);
}
