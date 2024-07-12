import 'package:flutter/material.dart';

import '../../../core/utils/text_style.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  const SizedBox(height: 30),
                  const Text(
                    'Selamat datang di ',
                    style: AppTextStyle.medium,
                  ),
                  const Text('GL Manager APP',
                      style: AppTextStyle.headingPrimary),
                  const SizedBox(height: 20),
                  Container(
                    height: 1,
                    width: 300,
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  const SizedBox(height: 30),
                  // const CarouselWidget(),
                  // const SizedBox(height: 30),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
