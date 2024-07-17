import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'data/datasources/auth/auth_local_datasource.dart';
import 'data/datasources/auth/auth_remote_datasource.dart';
import 'data/repositories/auth/auth_repository_impl.dart';
import 'domain/repositories/auth/auth_repository.dart';
import 'domain/usecases/auth/check_login_usecase.dart';
import 'domain/usecases/auth/forgot_password_usecase.dart';
import 'domain/usecases/auth/update_user_usecase.dart';
import 'domain/usecases/auth/get_user_data_usecase.dart';
import 'domain/usecases/auth/login_usecase.dart';
import 'domain/usecases/auth/logout_usecase.dart';
import 'domain/usecases/auth/register_usecase.dart';
import 'presentation/cubit/auth/get_user/get_user_cubit.dart';
import 'presentation/cubit/auth/login/login_cubit.dart';
import 'presentation/cubit/auth/register/register_cubit.dart';
import 'presentation/cubit/auth/update_user/update_user_cubit.dart';

final sl = GetIt.instance;

Future<void> initLocator() async {
  sl.allowReassignment = true;

  ///////////////
  ///! EXTERNAL
  ///////////////

  final SupabaseClient sb = Supabase.instance.client;

  sl.registerSingleton<SupabaseClient>(sb);

  ///////////////
  ///! Bloc / Cubit
  ///////////////

  //? Authentication
  sl.registerFactory(
    () => LoginCubit(
        checkLoginUsecase: sl(), loginUsecase: sl(), logoutUsecase: sl()),
  );
  sl.registerFactory(
    () => RegisterCubit(registerUsecase: sl()),
  );
  sl.registerFactory(
    () => GetUserCubit(getUserDataUsecase: sl()),
  );
  sl.registerFactory(
    () => UpdateUserCubit(updateUserUsecase: sl()),
  );
  // sl.registerFactory(
  //   () => ChangePasswordCubit(),
  // );

  ///////////////
  //! Usecase
  ///////////////

  //? Authentication
  sl.registerLazySingleton(() => LoginUsecase(authRepository: sl()));
  sl.registerLazySingleton(() => RegisterUsecase(authRepository: sl()));
  sl.registerLazySingleton(() => LogoutUsecase(authRepository: sl()));
  sl.registerLazySingleton(() => CheckLoginUsecase(authRepository: sl()));
  sl.registerLazySingleton(() => ForgotPasswordUsecase(authRepository: sl()));
  sl.registerLazySingleton(() => UpdateUserUsecase(authRepository: sl()));
  sl.registerLazySingleton(() => GetUserDataUsecase(authRepository: sl()));

  ///////////////
  //! Repository
  ///////////////

  //? Authentication
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authLocalDatasource: sl(),
      authRemoteDataSource: sl(),
    ),
  );

  ///////////////
  //! DataSource
  ///////////////

  //? Authentication
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(supabase: sb),
  );
  sl.registerLazySingleton<AuthLocalDatasource>(
    () => AuthLocalDatasourceImpl(),
  );
}
