import 'package:flutter/material.dart';

import '/routes/app_route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRoute.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF007466),
          primary: Color(0xFF007466),
          brightness: Brightness.light,
        ),
      ),
    );
  }
}
