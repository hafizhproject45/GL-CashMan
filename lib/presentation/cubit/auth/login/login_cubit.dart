import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/usecases/auth/check_login_usecase.dart';
import '../../../../domain/usecases/auth/login_usecase.dart';
import '../../../../domain/usecases/auth/logout_usecase.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../domain/entities/auth/login_request_entity.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final CheckLoginUsecase checkLoginUsecase;
  final LoginUsecase loginUsecase;
  final LogoutUsecase logoutUsecase;

  LoginCubit({
    required this.checkLoginUsecase,
    required this.loginUsecase,
    required this.logoutUsecase,
  }) : super(LoginInitial());

  Future<void> checkLogin() async {
    emit(LoginInitial());

    Either<Failure, bool> result = await checkLoginUsecase.call(NoParams());
    await Future.delayed(const Duration(seconds: 3));

    result.fold(
      (failure) => emit(LoginLoggedOut()),
      (value) {
        emit(LoginLoggedIn());
      },
    );
  }

  void login(String email, String password) async {
    emit(LoginLoading());

    LoginRequestEntity loginData = LoginRequestEntity(
      email: email,
      password: password,
    );

    Either<Failure, void> result = await loginUsecase.call(loginData);

    result.fold(
      (l) => emit(LoginFailed(message: l.message!)),
      (r) => emit(LoginLoggedIn()),
    );
  }

  void logout() async {
    Either<Failure, void> result = await logoutUsecase.call(NoParams());

    result.fold(
      (l) => emit(LoginFailed(message: l.message!)),
      (r) => emit(LoginLoggedOut()),
    );
  }
}
