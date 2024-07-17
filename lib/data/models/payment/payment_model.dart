import '../../../domain/entities/payment/payment_entity.dart';

class PaymentModel extends PaymentEntity {
  const PaymentModel({
    required super.id,
    required super.paymentFrom,
    required super.email,
    required super.date,
    required super.imageUrl,
    required super.createdAt,
  });

  // create factory original
}
