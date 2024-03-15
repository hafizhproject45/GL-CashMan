import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/utils/color_pallete.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/bg.png', // Gantilah dengan path gambar Anda
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 50),
                    height: 150,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                  Column(
                    children: [
                      Text(
                        'GL Manager APP',
                        style: TextStyle(
                          fontSize: 36,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'Aplikasi pengelola pembayaran uang kas.',
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                      SizedBox(height: 20),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 50),
                        ),
                        onPressed: () {
                          context.go('/login');
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(color: ColorPallete.primaryColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 10,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  '© Copyright 2024 by Grand Laswi, Al Right Reserved',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
