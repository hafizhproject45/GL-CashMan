// ignore_for_file: annotate_overrides, overridden_fields

part of 'get_user_cubit.dart';

abstract class GetUserState extends Equatable {
  final String? message;

  const GetUserState(this.message);

  @override
  List<Object?> get props => [message];
}

class GetUserInitial extends GetUserState {
  const GetUserInitial() : super(null);
}

class GetUserLoading extends GetUserState {
  const GetUserLoading() : super(null);
}

class GetUserLoaded extends GetUserState {
  final UserEntity? data;

  const GetUserLoaded({
    required this.data,
  }) : super(null);

  @override
  List<Object?> get props => [data, message];
}

class GetUserNotLoaded extends GetUserState {
  final String message;

  const GetUserNotLoaded({
    required this.message,
  }) : super(message);

  @override
  List<Object?> get props => [message];
}
