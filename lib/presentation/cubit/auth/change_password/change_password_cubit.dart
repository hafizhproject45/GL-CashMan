import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'change_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(ForgotPasswordInitial());
}
