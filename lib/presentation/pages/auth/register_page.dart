import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/images.dart';
import '../../../core/utils/text_style.dart';
import '../../../injection_container.dart';
import '../../cubit/auth/register/register_cubit.dart';
import '../../widgets/global/my_background_image.dart';
import '../../widgets/register/register_form_section.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RegisterCubit>(),
      child: _content(),
    );
  }

  Widget _content() {
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
    );
  }
}
