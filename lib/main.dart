import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../routes/app_route.dart';
import '../styles/color_pallete.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyAAC-ki-KW-rvx82M7Bvhzfave-CrDoxkM",
      appId: "1:164251625311:android:4a070e2254b0a96406b8ea",
      messagingSenderId: "164251625311",
      projectId: "gl-manager-dev",
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
