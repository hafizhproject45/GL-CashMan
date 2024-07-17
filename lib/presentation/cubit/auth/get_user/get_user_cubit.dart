import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../../domain/usecases/auth/get_user_data_usecase.dart';
import '../../../../domain/entities/auth/user_entity.dart';

part 'get_user_state.dart';

class GetUserCubit extends Cubit<GetUserState> {
  final GetUserDataUsecase getUserDataUsecase;

  GetUserCubit({
    required this.getUserDataUsecase,
  }) : super(const GetUserInitial());

  void getData() async {
    emit(const GetUserLoading());

    final data = await getUserDataUsecase.call(NoParams());

    data.fold(
      (l) => emit(GetUserNotLoaded(message: l.message!)),
      (r) => emit(GetUserLoaded(data: r)),
    );
  }
}
