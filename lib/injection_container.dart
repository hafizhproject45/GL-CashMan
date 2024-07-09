import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get_it/get_it.dart';

import 'data/datasources/auth/auth_local_datasource.dart';
import 'data/datasources/auth/auth_remote_datasource.dart';
import 'data/repositories/auth/auth_repository_impl.dart';
import 'domain/repositories/auth/auth_repository.dart';
import 'domain/usecases/auth/check_login_usecase.dart';
import 'domain/usecases/auth/forgot_password_usecase.dart';
import 'domain/usecases/auth/get_create_current_user_usecase.dart';
import 'domain/usecases/auth/get_current_uid_usecase.dart';
import 'domain/usecases/auth/get_update_user_usecase.dart';
import 'domain/usecases/auth/get_user_data_usecase.dart';
import 'domain/usecases/auth/google_auth_usecase.dart';
import 'domain/usecases/auth/login_usecase.dart';
import 'domain/usecases/auth/logout_usecase.dart';
import 'domain/usecases/auth/register_usecase.dart';
import 'presentation/cubit/auth/get_user/get_user_cubit.dart';
import 'presentation/cubit/auth/login/login_cubit.dart';
import 'presentation/cubit/auth/register/register_cubit.dart';

final sl = GetIt.instance;

Future<void> initLocator() async {
  sl.allowReassignment = true;

  ///////////////
  ///! EXTERNAL
  ///////////////

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseStorage storage = FirebaseStorage.instance;

  sl.registerSingleton(() => auth);
  sl.registerSingleton(() => fireStore);
  sl.registerSingleton(() => googleSignIn);
  sl.registerSingleton(() => storage);

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
    () => GetUserCubit(authRepository: sl(), getUserDataUsecase: sl()),
  );
  // sl.registerFactory(
  //   () => UpdateUserCubit(),
  // );
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
  sl.registerLazySingleton(
    () => GetCreateCurrentUserUsecase(authRepository: sl()),
  );
  sl.registerLazySingleton(() => GetCurrentUidUsecase(authRepository: sl()));
  sl.registerLazySingleton(() => GetUpdateUserUsecase(authRepository: sl()));
  sl.registerLazySingleton(() => GetUserDataUsecase(authRepository: sl()));
  sl.registerLazySingleton(() => GoogleAuthUsecase(authRepository: sl()));

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
    () => AuthRemoteDataSourceImpl(
      auth: auth,
      firestore: fireStore,
      googleSignIn: googleSignIn,
    ),
  );
  sl.registerLazySingleton<AuthLocalDatasource>(
    () => AuthLocalDatasourceImpl(),
  );
}
