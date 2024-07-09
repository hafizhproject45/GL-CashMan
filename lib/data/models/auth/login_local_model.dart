// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: annotate_overrides, overridden_fields

import 'package:hive_flutter/hive_flutter.dart';

import '../../../domain/entities/auth/login_local_entity.dart';

part 'login_local_model.g.dart';

@HiveType(typeId: 1)
class LoginLocalModel extends LoginLocalEntity {
  @HiveField(0)
  final int userId;
  @HiveField(1)
  final String email;
  @HiveField(2)
  final String fullname;

  const LoginLocalModel({
    required this.userId,
    required this.email,
    required this.fullname,
  }) : super(
          userId: userId,
          email: email,
          fullname: fullname,
        );

  factory LoginLocalModel.fromJson(Map<String, dynamic> map) {
    return LoginLocalModel(
      userId: map['id'] as int,
      email: map['email'] as String,
      fullname: map['fullname'] as String,
    );
  }
}
