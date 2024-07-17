import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../core/utils/images.dart';
import '../../core/utils/text_style.dart';
import '../widgets/global/button/my_button_widget.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  AppImages.bg,
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
                  Image.asset(
                    AppImages.logoGL,
                    width: 150,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  ),
                  const SizedBox(height: 30),
                  Column(
                    children: [
                      const Text(
                        'GL CashMan',
                        style: TextStyle(
                          fontSize: 36,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Text(
                        'Aplikasi pengelola pembayaran uang kas.',
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                      const SizedBox(height: 30),
                      MyButtonWidget(
                        borderRadius: 10,
                        width: 200,
                        onPressed: () => Get.offNamed('/login'),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.login,
                              color: Colors.white,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Login / Register',
                              style: AppTextStyle.bodyWhite,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          const Positioned(
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
