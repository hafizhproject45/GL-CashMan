import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';

import 'presentation/pages/landing_page.dart';
import 'presentation/pages/splash/splash_page.dart';
import 'core/utils/colors.dart';
import 'core/utils/route.dart';
import 'injection_container.dart';
import 'presentation/widgets/navbar.dart';
import 'services/initialize_app.dart';
import 'presentation/cubit/auth/login/login_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Force orientation portrait
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  // initialize firebase service
  await Firebase.initializeApp();

  await InitializeApp.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLogin = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _checkIfLogin();
  }

  // Method untuk memeriksa apakah pengguna sudah masuk
  void _checkIfLogin() {
    _auth.authStateChanges().listen((User? user) async {
      if (user != null && mounted) {
        setState(() {
          isLogin = true;
        });
        await Future.delayed(const Duration(seconds: 3));
        Get.offNamed('/navbar');
      } else {
        setState(() {
          isLogin = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LoginCubit>()..checkLogin(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'GL Manager',
        theme: ThemeData(
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
