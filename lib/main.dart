import 'package:flutter/material.dart';

import './routes/app_route.dart';
import 'styles/color_pallete.dart';

void main() => runApp(MyApp());

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
