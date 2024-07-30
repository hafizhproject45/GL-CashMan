import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';

import '../../../core/utils/text_style.dart';
import '../../../core/utils/toast.dart';
import '../../cubit/auth/login/login_cubit.dart';
import '../global/button/my_button_widget.dart';
import '../global/text_field_auth/text_field_text_widget.dart';

class ForgotPasswordFormSection extends StatefulWidget {
  const ForgotPasswordFormSection({super.key});

  @override
  State<ForgotPasswordFormSection> createState() =>
      _ForgotPasswordFormSectionState();
}

class _ForgotPasswordFormSectionState extends State<ForgotPasswordFormSection> {
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Form(
      key: _formKey,
      child: SizedBox(
        width: screenWidth * 0.93,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Forgot Password',
              style: AppTextStyle.headingWhite,
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: screenWidth * 0.8,
              child: const Text(
                "Enter your email\nand we'll send you a link to reset your password.",
                style: AppTextStyle.mediumWhite,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40),
            MyTextFieldText(
              name: "Email",
              type: TextInputType.emailAddress,
              iconz: Icons.email,
              focusNode: _emailFocusNode,
              controller: _emailController,
              textInputAction: TextInputAction.next,
              width: screenWidth * 0.85,
              validator: (value) {
                String pattern =
                    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                RegExp regex = RegExp(pattern);

                if (value!.isEmpty) {
                  return 'Email is required';
                } else if (!regex.hasMatch(value)) {
                  return "Email isn't valid";
                }
                return null;
              },
            ),
            const SizedBox(height: 30),
            BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginFailed) {
                  dangerToast(
                    msg: state.message,
                  );
                } else if (state is LoginLoggedIn) {
                  Get.offAllNamed('/');
                }
              },
              builder: (context, state) {
                return MyButtonWidget(
                  label: 'SEND',
                  width: screenWidth * 0.85,
                  onPressed: () {
                    if (state is! LoginLoading) {
                      _emailFocusNode.unfocus();
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                      }
                    }
                  },
                  isLoading: state is LoginLoading,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
