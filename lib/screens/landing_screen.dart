import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/utils/color_pallete.dart';

class LandingScreen extends StatelessWidget {
  static const routeName = '/landingScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/bg.png'), // Gantilah dengan path gambar Anda
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'GL Manager APP',
              style: TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              'Aplikasi pengelola pembayaran uang kas.',
              style: TextStyle(fontSize: 10, color: Colors.white),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //! LOGIN BUTTON
                TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 50)),
                  onPressed: () {
                    context.go('/login');
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: ColorPallete.primaryColor),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
