import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/auth/register_request_entity.dart';
import '../../../../domain/usecases/auth/register_usecase.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUsecase registerUsecase;

  RegisterCubit({
    required this.registerUsecase,
  }) : super(RegisterInitial());

  void register(RegisterRequestEntity request) async {
    emit(RegisterLoading());

    final registerRequest = RegisterRequestEntity(
      fullname: request.fullname,
      block: request.block,
      email: request.email,
      contact: request.contact,
      password: request.password,
      createdAt: request.createdAt,
      updatedAt: request.updatedAt,
    );

    final result = await registerUsecase.call(registerRequest);

    result.fold(
      (l) => emit(RegisterFailed(message: l.message!)),
      (r) => emit(RegisterSuccess()),
    );
  }
}
