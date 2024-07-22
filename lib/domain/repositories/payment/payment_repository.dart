import 'package:dartz/dartz.dart';
import '../../entities/payment/payment_entity.dart';

import '../../../core/errors/failures.dart';

abstract class PaymentRepository {
  Future<Either<Failure, void>> payment(PaymentEntity request);
  Future<Either<Failure, String>> getImageUrl(String name,
      {bool getImageUrl = true});
  Future<Either<Failure, List<PaymentEntity>>> getPayment(int userId);
  Future<Either<Failure, void>> deletePayment(int paymentId, String imageUrl);
}
