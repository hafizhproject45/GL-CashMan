import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../../domain/usecases/payment/get_payment_usecase.dart';
import '../../../../domain/entities/payment/payment_entity.dart';

part 'get_payment_state.dart';

class GetPaymentCubit extends Cubit<GetPaymentState> {
  final GetPaymentUsecase getPaymentUsecase;

  GetPaymentCubit({
    required this.getPaymentUsecase,
  }) : super(const GetPaymentInitial());

  Future<void> getData() async {
    emit(const GetPaymentLoading());

    final data = await getPaymentUsecase.call(NoParams());

    data.fold(
      (l) => emit(GetPaymentNotLoaded(message: l.message!)),
      (r) => emit(GetPaymentLoaded(data: r)),
    );
  }
}
