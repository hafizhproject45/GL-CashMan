import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/utils/colors.dart';
import 'core/utils/env.dart';
import 'core/utils/route.dart';
import 'injection_container.dart';
import 'presentation/cubit/auth/login/login_cubit.dart';
import 'presentation/pages/landing_page.dart';
import 'presentation/pages/splash/splash_page.dart';
import 'presentation/widgets/global/navbar.dart';
import 'services/initialize_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Force orientation portrait
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  // Initialize firebase service
  await Firebase.initializeApp();

  // Initialize supabase
  await Supabase.initialize(
    url: Env.sbUrl,
    anonKey: Env.sbAnonKey,
  );

  // Initialize else
  await InitializeApp.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LoginCubit>()..checkLogin(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'GL Manager',
        theme: ThemeData(
          scaffoldBackgroundColor: AppColor.background,
          primaryColor: AppColor.primary,
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColor.primary,
            primary: AppColor.primary,
            brightness: Brightness.light,
          ),
        ),
        home: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            if (state is LoginLoggedIn) {
              return const MyNavigationBar();
            } else if (state is LoginInitial) {
              return BlocProvider.value(
                value: BlocProvider.of<LoginCubit>(context),
                child: const SplashPage(),
              );
            }

            return BlocProvider.value(
              value: BlocProvider.of<LoginCubit>(context),
              child: const LandingPage(),
            );
          },
        ),
        getPages: AppRoute.pageRoute,
      ),
    );
  }
}
