import '../../../domain/entities/auth/user_entity.dart';

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

  static UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      fullname: json['fullname'] ?? '',
      block: json['block'] ?? '',
      contact: json['contact'] ?? '',
      email: json['email'] ?? '',
      createdAt: json['created_at'] ?? '',
      updateAt: json['update_at'] ?? '',
    );
  }
}
