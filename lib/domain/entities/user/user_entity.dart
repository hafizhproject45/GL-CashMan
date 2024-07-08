// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? id;
  final String? fullname;
  final String? block;
  final String? contact;
  final String? email;
  final String? password;
  final bool? status;
  final String? createdAt;
  final String? updateAt;

  const UserEntity({
    this.id,
    this.fullname,
    this.block,
    this.contact,
    this.email,
    this.password,
    this.status,
    this.createdAt,
    this.updateAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullname': fullname,
      'block': block,
      'contact': contact,
      'email': email,
      'password': password,
      'status': status,
      'created_at': createdAt,
      'update_at': updateAt,
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
      status,
      createdAt,
      updateAt,
    ];
  }
}
