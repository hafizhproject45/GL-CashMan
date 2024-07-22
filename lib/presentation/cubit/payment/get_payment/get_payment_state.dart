// ignore_for_file: overridden_fields, annotate_overrides

part of 'get_payment_cubit.dart';

abstract class GetPaymentState extends Equatable {
  final String? message;

  const GetPaymentState(this.message);

  @override
  List<Object?> get props => [message];
}

class GetPaymentInitial extends GetPaymentState {
  const GetPaymentInitial() : super(null);
}

class GetPaymentLoading extends GetPaymentState {
  const GetPaymentLoading() : super(null);
}

class GetPaymentLoaded extends GetPaymentState {
  final List<PaymentEntity>? data;

  const GetPaymentLoaded({
    required this.data,
  }) : super(null);

  @override
  List<Object?> get props => [data, message];
}

class GetPaymentNotLoaded extends GetPaymentState {
  final String message;

  const GetPaymentNotLoaded({
    required this.message,
  }) : super(message);

  @override
  List<Object?> get props => [message];
}
