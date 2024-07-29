import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/forgot_password/forgot_password_form_section.dart';
import '../../../core/utils/text_style.dart';
import '../../widgets/global/my_background_image.dart';
import '../../../core/utils/images.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return _content();
  }

  Widget _content() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: MyBackgroundImage(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              AppImages.bg,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: SizedBox(
                width: screenWidth * 0.85,
                height: screenheight * 0.97,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Image.asset(
                          AppImages.logoGL,
                          width: 150,
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 100),
                      child: ForgotPasswordFormSection(),
                    ),
                    const Positioned(
                      left: 0,
                      right: 0,
                      bottom: 10,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          '© Copyright 2024 by Grand Laswi, Al Right Reserved',
                          style: AppTextStyle.small,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 20,
                      left: -10,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          onPressed: () => Get.back(),
                          icon: const Icon(
                            Icons.arrow_back_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
