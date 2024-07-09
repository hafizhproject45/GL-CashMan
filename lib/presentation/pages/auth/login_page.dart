import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gl_app/core/utils/text_style.dart';
import 'package:gl_app/injection_container.dart';
import 'package:gl_app/presentation/cubit/auth/login/login_cubit.dart';

import '../../../core/utils/images.dart';
import '../../widgets/login/login_form_section.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => sl<LoginCubit>(),
      child: _content(screenWidth, screenHeight),
    );
  }

  Widget _content(double screenWidth, double screenHeight) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                AppImages.bg,
              ),
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            ),
          ),
          child: Stack(
            children: [
              Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppImages.logoGL,
                        width: 150,
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                      ),
                      const SizedBox(height: 30),
                      const LoginFormSection(),
                    ],
                  ),
                ),
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
            ],
          ),
        ),
      ),
    );
  }
}
