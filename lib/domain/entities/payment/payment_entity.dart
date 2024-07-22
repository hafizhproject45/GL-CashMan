// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class PaymentEntity extends Equatable {
  final int? id;
  final int? userId;
  final String? imageUrl;
  final String paymentDate;
  final String? createdAt;
  final String? updatedAt;

  const PaymentEntity({
    this.id,
    this.userId,
    this.imageUrl,
    required this.paymentDate,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'image_url': imageUrl,
      'payment_date': paymentDate,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  @override
  List<Object?> get props {
    return [
      id,
      userId,
      imageUrl,
      paymentDate,
      createdAt,
      updatedAt,
    ];
  }
}
