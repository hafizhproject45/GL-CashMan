// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String fullname;
  final String block;
  final String contact;
  final String email;
  final String createdAt;
  final String updateAt;

  const UserEntity({
    required this.id,
    required this.fullname,
    required this.block,
    required this.contact,
    required this.email,
    required this.createdAt,
    required this.updateAt,
  });

  @override
  List<Object> get props {
    return [id, fullname, block, contact, email, createdAt, updateAt];
  }
}
