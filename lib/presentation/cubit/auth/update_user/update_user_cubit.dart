import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../domain/usecases/auth/update_user_usecase.dart';

import '../../../../domain/entities/auth/update_request_entity.dart';

part 'update_user_state.dart';

class UpdateUserCubit extends Cubit<UpdateUserState> {
  final UpdateUserUsecase updateUserUsecase;

  UpdateUserCubit({
    required this.updateUserUsecase,
  }) : super(UpdateUserInitial());

  Future<void> update(UpdateRequestEntity request) async {
    emit(UpdateUserLoading());

    final result = await updateUserUsecase.call(request);

    result.fold(
      (l) => Left(UpdateUserFailed(message: l.message!)),
      (r) => Right(UpdateUserSuccess()),
    );
  }
}
