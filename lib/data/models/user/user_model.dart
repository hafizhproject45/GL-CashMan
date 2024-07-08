import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/entities/user/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    super.id,
    super.fullname,
    super.block,
    super.contact,
    super.email,
    super.password,
    super.status,
    super.createdAt,
    super.updateAt,
  });

  static UserModel fromJson(DocumentSnapshot<Map<String, dynamic>> json) {
    return UserModel(
      id: json['id'],
      fullname: json['fullname'],
      block: json['block'],
      contact: json['contact'],
      email: json['email'],
      password: json['password'],
      status: json['status'],
      createdAt: json['created_at'],
      updateAt: json['update_at'],
    );
  }
}
