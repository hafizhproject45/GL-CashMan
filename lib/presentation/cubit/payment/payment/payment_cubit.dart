import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/payment/payment_entity.dart';
import '../../../../domain/usecases/payment/payment_usecase.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final PaymentUsecase paymentUsecase;

  PaymentCubit({
    required this.paymentUsecase,
  }) : super(PaymentInitial());

  Future<void> payment(PaymentEntity request) async {
    emit(PaymentLoading());

    final result = await paymentUsecase.call(request);

    result.fold(
      (l) => emit(PaymentFailed(message: l.message!)),
      (r) => emit(PaymentSuccess()),
    );
  }
}
