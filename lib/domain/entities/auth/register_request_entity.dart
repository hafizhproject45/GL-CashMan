import 'package:equatable/equatable.dart';

class RegisterRequestEntity extends Equatable {
  final String? id;
  final String fullname;
  final String block;
  final String contact;
  final String email;
  final String password;
  final String? createdAt;
  final String? updatedAt;

  const RegisterRequestEntity({
    this.id,
    required this.fullname,
    required this.block,
    required this.contact,
    required this.email,
    required this.password,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullname': fullname,
      'block': block,
      'contact': contact,
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
      contact,
      email,
      password,
      createdAt,
      updatedAt,
    ];
  }
}
