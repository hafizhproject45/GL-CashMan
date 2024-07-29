import 'package:equatable/equatable.dart';

class UserLocalEntity extends Equatable {
  final int userId;
  final String email;
  final String fullname;
  final String session;

  const UserLocalEntity({
    required this.userId,
    required this.email,
    required this.fullname,
    required this.session,
  });

  @override
  List<Object> get props => [userId, email, fullname, session];
}
