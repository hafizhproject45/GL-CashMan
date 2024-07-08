import 'package:cloud_firestore/cloud_firestore.dart';

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

  static PaymentModel fromJson(DocumentSnapshot<Map<String, dynamic>> json) {
    return PaymentModel(
      id: json['id'],
      paymentFrom: json['payment_from'],
      email: json['email'],
      date: json['date'],
      imageUrl: json['image_url'],
      createdAt: json['created_at'],
    );
  }
}
