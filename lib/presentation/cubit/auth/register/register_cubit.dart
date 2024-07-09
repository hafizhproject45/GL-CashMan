import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
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

    Either<Failure, void> result = await registerUsecase.call(request);

    result.fold(
      (l) => emit(RegisterFailed(message: l.message!)),
      (r) => emit(RegisterSuccess()),
    );
  }
}
