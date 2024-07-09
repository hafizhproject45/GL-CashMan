// ignore_for_file: annotate_overrides, overridden_fields

part of 'register_cubit.dart';

abstract class RegisterState extends Equatable {
  final String? message;

  const RegisterState({this.message});

  @override
  List<Object?> get props => [message];
}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterFailed extends RegisterState {
  final String message;

  const RegisterFailed({required this.message}) : super(message: message);
}

final class RegisterSuccess extends RegisterState {}
