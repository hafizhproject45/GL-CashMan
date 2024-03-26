import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
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
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                        ),
                        onPressed: () {
                          context.go('/login');
                        },
                        child: Row(
                          children: [
                            Icon(Icons.login),
                            SizedBox(width: 10),
                            Text(
                              'Login / Register',
                            ),
                          ],
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
                    fontSize: 8,
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
