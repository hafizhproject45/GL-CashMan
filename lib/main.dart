import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'core/utils/colors.dart';
import 'core/utils/route.dart';
import 'presentation/widgets/navbar.dart';
import 'services/initialize_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Force orientation portrait
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  await InitializeApp.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GL Manager',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColor.primary,
          primary: AppColor.primary,
          brightness: Brightness.light,
        ),
      ),
      home: const MyNavigationBar(),
      getPages: AppRoute.pageRoute,
    );
  }
}
