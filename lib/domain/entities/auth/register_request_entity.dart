import 'package:equatable/equatable.dart';

class RegisterRequestEntity extends Equatable {
  final int? id;
  final String fullname;
  final String block;
  final String phone;
  final String email;
  final String password;
  final String? createdAt;
  final String? updatedAt;

  const RegisterRequestEntity({
    this.id,
    required this.fullname,
    required this.block,
    required this.phone,
    required this.email,
    required this.password,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'fullname': fullname,
      'block': block,
      'phone': phone,
      'email': email,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  @override
  List<Object?> get props {
    return [
      id,
      fullname,
      block,
      phone,
      email,
      password,
      createdAt,
      updatedAt,
    ];
  }
}
