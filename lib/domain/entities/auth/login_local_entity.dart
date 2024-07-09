import 'package:equatable/equatable.dart';

class LoginLocalEntity extends Equatable {
  final int userId;
  final String email;
  final String fullname;

  const LoginLocalEntity({
    required this.userId,
    required this.email,
    required this.fullname,
  });

  @override
  List<Object> get props => [userId, email, fullname];
}
