// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: annotate_overrides, overridden_fields

import 'package:hive_flutter/hive_flutter.dart';

import '../../../domain/entities/auth/user_local_entity.dart';

part 'user_local_model.g.dart';

@HiveType(typeId: 1)
class UserLocalModel extends UserLocalEntity {
  @HiveField(0)
  final int userId;
  @HiveField(1)
  final String email;
  @HiveField(2)
  final String fullname;
  @HiveField(3)
  final String session;

  const UserLocalModel({
    required this.userId,
    required this.email,
    required this.fullname,
    required this.session,
  }) : super(
          userId: userId,
          email: email,
          fullname: fullname,
          session: session,
        );

  factory UserLocalModel.fromJson(Map<String, dynamic> map) {
    return UserLocalModel(
      userId: map['id'] as int,
      email: map['email'] as String,
      fullname: map['fullname'] as String,
      session: map['session'] as String,
    );
  }
}
