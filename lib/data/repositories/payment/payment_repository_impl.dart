// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../../core/errors/exceptions.dart';
import '../../../core/errors/failures.dart';
import '../../../core/utils/constants.dart';
import '../../../domain/entities/payment/payment_entity.dart';
import '../../../domain/repositories/payment/payment_repository.dart';
import '../../datasources/payment/payment_datasource.dart';

class PaymentRepositoryImpl extends PaymentRepository {
  final PaymentDatasource paymentDatasource;

  PaymentRepositoryImpl({
    required this.paymentDatasource,
  });

  @override
  Future<Either<Failure, String>> getImageUrl(String name,
      {bool getImageUrl = true}) async {
    try {
      final res = await paymentDatasource.getImageUrl(name);

      return Right(res);
    } catch (e) {
      return Left(_handleException(e));
    }
  }

  @override
  Future<Either<Failure, void>> payment(PaymentEntity request) async {
    try {
      final res = await paymentDatasource.payment(request);

      return Right(res);
    } catch (e) {
      return Left(_handleException(e));
    }
  }

  @override
  Future<Either<Failure, List<PaymentEntity>>> getPayment(int userId) async {
    try {
      final res = await paymentDatasource.getPayment(userId);

      return Right(res);
    } catch (e) {
      return Left(_handleException(e));
    }
  }

  @override
  Future<Either<Failure, void>> deletePayment(
    int paymentId,
    String imageUrl,
  ) async {
    try {
      final res = await paymentDatasource.deletePayment(paymentId, imageUrl);
      return Right(res);
    } catch (e) {
      return Left(_handleException(e));
    }
  }

  _handleException(Object e) {
    if (e is ServerException) {
      return ServerFailure(message: e.message);
    } else if (e is FirebaseException) {
      return ServerFailure(message: e.message);
    } else {
      return const UnknownFailure(message: FAILURE_UNKNOWN);
    }
  }
}
