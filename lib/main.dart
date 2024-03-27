import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import '../secret/firebase_code.dart';
import '../../routes/app_route.dart';
import '../styles/color_pallete.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: FirebaseCode.apikey,
      appId: FirebaseCode.appId,
      messagingSenderId: FirebaseCode.messagingSenderId,
      projectId: FirebaseCode.projectId,
      storageBucket: FirebaseCode.bucket_url,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _auth = FirebaseAuth.instance;
  bool isLogin = false;

  @override
  void initState() {
    super.initState();
    _checkIfLogin();
  }

  // Method untuk memeriksa apakah pengguna sudah masuk
  void _checkIfLogin() {
    _auth.authStateChanges().listen((User? user) {
      if (user != null && mounted) {
        setState(() {
          isLogin = true;
        });
        AppRoute.router.go('/home');
      } else {
        setState(() {
          isLogin = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRoute.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colorz.primary,
          primary: Colorz.primary,
          brightness: Brightness.light,
        ),
      ),
    );
  }
}
