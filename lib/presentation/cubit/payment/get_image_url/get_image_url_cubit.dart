import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../../domain/usecases/payment/get_image_url_usecase.dart';

part 'get_image_url_state.dart';

class GetImageUrlCubit extends Cubit<GetImageUrlState> {
  final GetImageUrlUsecase getImageUrlUsecase;

  GetImageUrlCubit({
    required this.getImageUrlUsecase,
  }) : super(const GetImageUrlInitial());

  Future<void> getData() async {
    emit(const GetImageUrlLoading());

    final data = await getImageUrlUsecase.call(NoParams());

    data.fold(
      (l) => emit(GetImageUrlNotLoaded(message: l.message!)),
      (r) => emit(GetImageUrlLoaded(data: r)),
    );
  }
}
