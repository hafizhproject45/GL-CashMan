import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../domain/usecases/payment/upload_image_usecase.dart';

part 'upload_image_state.dart';

class UploadImageCubit extends Cubit<UploadImageState> {
  final UploadImageUsecase uploadImageUsecase;

  UploadImageCubit({
    required this.uploadImageUsecase,
  }) : super(UploadImageInitial());

  Future<void> upload() async {
    emit(UploadImageLoading());

    final data = await uploadImageUsecase.call(NoParams());

    data.fold(
      (l) => emit(UploadImageFailed(message: l.message!)),
      (r) => emit(UploadImageSuccess()),
    );
  }
}
