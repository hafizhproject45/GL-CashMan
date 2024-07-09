import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gl_app/core/utils/text_style.dart';
import 'package:gl_app/injection_container.dart';
import 'package:gl_app/presentation/cubit/auth/register/register_cubit.dart';

import '../../../core/utils/images.dart';
import '../../widgets/register/register_form_section.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => sl<RegisterCubit>(),
      child: _content(screenWidth, screenHeight),
    );
  }

  Scaffold _content(double screenWidth, double screenHeight) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.bg),
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
                      const SizedBox(height: 20),
                      const RegisterFormSection(),
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
