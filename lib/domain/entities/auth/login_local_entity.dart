import 'package:equatable/equatable.dart';

class LoginLocalEntity extends Equatable {
  final int userId;
  final String email;
  final String fullname;
  final String session;

  const LoginLocalEntity({
    required this.userId,
    required this.email,
    required this.fullname,
    required this.session,
  });

  @override
  List<Object> get props => [userId, email, fullname, session];
}
