import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/repositories/auth/auth_repository.dart';
import '../../../../domain/usecases/auth/get_user_data_usecase.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/constants.dart';
import '../../../../domain/entities/auth/user_entity.dart';

part 'get_user_state.dart';

class GetUserCubit extends Cubit<GetUserState> {
  final AuthRepository authRepository;
  final GetUserDataUsecase getUserDataUsecase;

  GetUserCubit({
    required this.authRepository,
    required this.getUserDataUsecase,
  }) : super(const GetUserInitial());

  void getData() async {
    emit(const GetUserLoading());

    Either<Failure, String> loginDataRequest =
        await authRepository.getCurrentUID();

    final String loginData = loginDataRequest.getOrElse(
      () => throw const CacheFailure(message: FAILURE_UNKNOWN),
    );

    Either<Failure, List<UserEntity>> data =
        await getUserDataUsecase.call(loginData);

    data.fold(
      (failure) => emit(GetUserNotLoaded(message: failure.message!)),
      (value) => emit(GetUserLoaded(data: value)),
    );
  }
}
