import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/entities/auth/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    super.id,
    super.fullname,
    super.block,
    super.contact,
    super.email,
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
      createdAt: json['created_at'],
      updateAt: json['update_at'],
    );
  }
}
