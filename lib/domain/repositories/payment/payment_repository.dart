import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../entities/payment/payment_entity.dart';

import '../../../core/errors/failures.dart';

abstract class PaymentRepository {
  Future<Either<Failure, TaskSnapshot>> uploadImage(String email);
  Future<Either<Failure, void>> payment(PaymentEntity request);
  Future<Either<Failure, String>> getImageUrl(String email,
      {bool getImageUrl = true});
  Future<Either<Failure, List<PaymentEntity>>> getPayment(int userId);
  Future<Either<Failure, void>> deletePayment(
    int paymentId,
    // String imageUrl,
  );
}
