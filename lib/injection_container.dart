import 'package:get_it/get_it.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'domain/usecases/payment/upload_image_usecase.dart';
import 'presentation/cubit/payment/upload_image/upload_image_cubit.dart';
import 'domain/usecases/payment/delete_payment_usecase.dart';
import 'presentation/cubit/payment/delete_payment/delete_payment_cubit.dart';
import 'data/datasources/faq/faq_datasource.dart';
import 'domain/repositories/faq/faq_repository.dart';
import 'domain/usecases/faq/get_faq_usecase.dart';
import 'domain/usecases/payment/get_payment_usecase.dart';
import 'presentation/cubit/faq/get_faq_cubit.dart';
import 'presentation/cubit/payment/get_payment/get_payment_cubit.dart';
import 'data/repositories/faq/faq_repository_impl.dart';
import 'domain/usecases/payment/get_image_url_usecase.dart';
import 'domain/usecases/payment/payment_usecase.dart';
import 'presentation/cubit/payment/get_image_url/get_image_url_cubit.dart';
import 'presentation/cubit/payment/payment/payment_cubit.dart';
import 'data/datasources/payment/payment_datasource.dart';
import 'data/datasources/auth/auth_local_datasource.dart';
import 'data/datasources/auth/auth_remote_datasource.dart';
import 'domain/repositories/payment/payment_repository.dart';
import 'data/repositories/auth/auth_repository_impl.dart';
import 'data/repositories/payment/payment_repository_impl.dart';
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
  final FirebaseStorage fs = FirebaseStorage.instance;

  sl.registerSingleton<SupabaseClient>(sb);
  sl.registerSingleton<FirebaseStorage>(fs);

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
  //   () => ForgotPasswordCubit(),
  // );

  //? Payment
  sl.registerFactory(() => UploadImageCubit(uploadImageUsecase: sl()));
  sl.registerFactory(() => PaymentCubit(paymentUsecase: sl()));
  sl.registerFactory(() => GetImageUrlCubit(getImageUrlUsecase: sl()));
  sl.registerFactory(() => GetPaymentCubit(getPaymentUsecase: sl()));
  sl.registerFactory(() => DeletePaymentCubit(deletePaymentUsecase: sl()));

  //? FAQ
  sl.registerFactory(() => GetFaqCubit(getFaqUsecase: sl()));

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

  //? Payment
  sl.registerLazySingleton(
    () => UploadImageUsecase(
      authRepository: sl(),
      paymentRepository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => PaymentUsecase(
      authRepository: sl(),
      paymentRepository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => GetImageUrlUsecase(
      authRepository: sl(),
      paymentRepository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => GetPaymentUsecase(
      authRepository: sl(),
      paymentRepository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => DeletePaymentUsecase(
      paymentRepository: sl(),
      authRepository: sl(),
    ),
  );

  //? FAQ
  sl.registerLazySingleton(() => GetFaqUsecase(faqRepository: sl()));

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

  //? Payment
  sl.registerLazySingleton<PaymentRepository>(
    () => PaymentRepositoryImpl(paymentDatasource: sl()),
  );

  //? FAQ
  sl.registerLazySingleton<FaqRepository>(
    () => FaqRepositoryImpl(faqDatasource: sl()),
  );

  ///////////////
  //! DataSource
  ///////////////

  //? Authentication
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(supabase: sl()),
  );
  sl.registerLazySingleton<AuthLocalDatasource>(
    () => AuthLocalDatasourceImpl(),
  );

  //? Payment
  sl.registerLazySingleton<PaymentDatasource>(
    () => PaymentDatasourceImpl(supabase: sl(), storage: sl()),
  );

  //? FAQ
  sl.registerLazySingleton<FaqDatasource>(
    () => FaqDatasourceImpl(supabase: sl()),
  );
}
