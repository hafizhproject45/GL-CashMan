// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class PaymentEntity extends Equatable {
  final String id;
  final String paymentFrom;
  final String email;
  final String date;
  final String imageUrl;
  final String createdAt;

  const PaymentEntity({
    required this.id,
    required this.paymentFrom,
    required this.email,
    required this.date,
    required this.imageUrl,
    required this.createdAt,
  });

  @override
  List<Object> get props {
    return [id, paymentFrom, email, date, imageUrl, createdAt];
  }
}
