import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/entities/user/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.fullname,
    required super.block,
    required super.contact,
    required super.email,
    required super.createdAt,
    required super.updateAt,
  });

  static UserModel fromJson(DocumentSnapshot<Map<String, dynamic>> json) {
    return UserModel(
      id: json['id'],
      fullname: json['fullname'],
      block: json['block'],
      contact: json['contact'],
      email: json['email'],
      createdAt: json['created_at'],
      updateAt: json['update_at'],
    );
  }
}
