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
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
