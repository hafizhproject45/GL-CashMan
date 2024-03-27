// import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:gl_app/routes/app_route.dart';

// import '../styles/color_pallete.dart';

// class SplashScreen extends StatefulWidget {
//   SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   final _auth = FirebaseAuth.instance;
//   bool isLogin = false;

//   @override
//   void initState() {
//     super.initState();
//     _navigateHome();
//     _checkIfLogin();
//   }

//   void _navigateHome() async {
//     await Future.delayed(Duration(milliseconds: 1500), () {});
//     AppRoute.router.go('/home');
//     _checkIfLogin();
//   }

//   void _checkIfLogin() {
//     _auth.authStateChanges().listen((User? user) {
//       if (user != null && mounted) {
//         setState(() {
//           isLogin = true;
//         });
//         AppRoute.router.go('/home');
//       } else {
//         setState(() {
//           isLogin = false;
//         });
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FlutterSplashScreen.scale(
//       gradient: LinearGradient(
//         begin: Alignment.topCenter,
//         end: Alignment.bottomCenter,
//         colors: [
//           Colors.white,
//           Colorz.primary,
//         ],
//       ),
//       childWidget: SizedBox(
//         height: 50,
//         child: Image.asset("assets/logo.png"),
//       ),
//       duration: Duration(milliseconds: 1500),
//       animationDuration: Duration(milliseconds: 1000),
//       onAnimationEnd: () => debugPrint("On Scale End"),
//     );
//   }
// }
