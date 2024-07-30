import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

import '../../../core/utils/utility.dart';
import '../../../core/utils/text_style.dart';
import '../../../core/utils/toast.dart';
import '../../../domain/entities/auth/register_request_entity.dart';
import '../../cubit/auth/register/register_cubit.dart';
import '../global/button/my_button_widget.dart';
import '../global/text_field_auth/text_field_password_widget.dart';
import '../global/text_field_auth/text_field_text_widget.dart';
import '../global/text_field_normal/text_field_normal_widget.dart';

class RegisterFormSection extends StatefulWidget {
  const RegisterFormSection({super.key});

  @override
  State<RegisterFormSection> createState() => _RegisterFormSectionState();
}

class _RegisterFormSectionState extends State<RegisterFormSection> {
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _blockController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final FocusNode _fullnameFocusNode = FocusNode();
  final FocusNode _blockFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _fullnameController.dispose();
    _blockController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _fullnameFocusNode.dispose();
    _blockFocusNode.dispose();
    _phoneFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // _fullnameController.text = 'Hafizh Athallah Yovanka';
    // _blockController.text = '88 B';
    // _phoneController.text = '085175435207';
    // _emailController.text = 'hafizhathallah45@gmail.com';
    // _passwordController.text = 'Hafizh123';
    // _confirmPasswordController.text = 'Hafizh123';

    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'REGISTER',
            style: AppTextStyle.headingWhite,
          ),
          const SizedBox(height: 30),
          MyTextFieldText(
            name: "Fullname",
            iconz: Icons.person,
            textInputAction: TextInputAction.next,
            type: TextInputType.name,
            focusNode: _fullnameFocusNode,
            controller: _fullnameController,
            width: screenWidth * 0.85,
            validator: (value) {
              if (value!.isEmpty) {
                return "Fullname is required";
              } else if (value.length > 50) {
                return "Fullname to long";
              }
              return null;
            },
          ),
          MyTextFieldNormal(
            name: "Block",
            iconz: Icons.home_work_rounded,
            type: TextInputType.streetAddress,
            textInputAction: TextInputAction.next,
            focusNode: _blockFocusNode,
            isBlock: true,
            textwhite: true,
            controller: _blockController,
            width: screenWidth * 0.85,
            validator: (value) {
              if (value!.isEmpty) {
                return "Block is required";
              } else if (value.length > 5) {
                return "Block doesn't valid";
              }
              return null;
            },
          ),
          MyTextFieldText(
            name: "Phone",
            iconz: Icons.phone_android,
            textInputAction: TextInputAction.next,
            type: TextInputType.phone,
            focusNode: _phoneFocusNode,
            controller: _phoneController,
            width: screenWidth * 0.85,
            validator: (value) {
              String pattern = r'(^[0-9]{10,15}$)';
              RegExp regExp = RegExp(pattern);

              if (value!.isEmpty) {
                return "Phone is required";
              } else if (!regExp.hasMatch(value)) {
                return "Phone doesn't valid";
              }
              return null;
            },
          ),
          MyTextFieldText(
            name: "Email",
            iconz: Icons.email,
            textInputAction: TextInputAction.next,
            type: TextInputType.emailAddress,
            focusNode: _emailFocusNode,
            controller: _emailController,
            width: screenWidth * 0.85,
            validator: (value) {
              String pattern =
                  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
              RegExp regex = RegExp(pattern);

              if (value!.isEmpty) {
                return 'Email is required';
              } else if (!regex.hasMatch(value)) {
                return "Email doesn't valid";
              }
              return null;
            },
          ),
          MyTextFieldPassword(
            iconz: Icons.lock,
            textInputAction: TextInputAction.next,
            focusNode: _passwordFocusNode,
            controller: _passwordController,
            width: screenWidth * 0.85,
            validator: (value) {
              if (value!.isEmpty) {
                return "Password is required";
              } else if (value.length < 6) {
                return "Password min 6 characters";
              } else if (value.length >= 30) {
                return "Password maksimal 30 characters";
              }
              return null;
            },
          ),
          MyTextFieldPassword(
            name: "Confirm Password",
            iconz: Icons.lock,
            textInputAction: TextInputAction.send,
            focusNode: _confirmPasswordFocusNode,
            controller: _confirmPasswordController,
            width: screenWidth * 0.85,
            validator: (value) {
              if (value!.isEmpty) {
                return "Confirm Password is required";
              } else if (value.length < 6) {
                return "Password min 6 characters";
              } else if (_passwordController.text !=
                  _confirmPasswordController.text) {
                return "Password not matches";
              } else if (value.length >= 30) {
                return "Password maksimal 30 characters";
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          BlocConsumer<RegisterCubit, RegisterState>(
            listener: (context, state) {
              if (state is RegisterFailed) {
                dangerToast(msg: state.message);
              } else if (state is RegisterSuccess) {
                Get.offAllNamed('/login');
                successToast(msg: 'Successfully created an account');
              }
            },
            builder: (context, state) {
              return MyButtonWidget(
                label: 'REGISTER',
                width: screenWidth * 0.85,
                onPressed: () {
                  if (state is! RegisterLoading) {
                    _fullnameFocusNode.unfocus();
                    _blockFocusNode.unfocus();
                    _phoneFocusNode.unfocus();
                    _emailFocusNode.unfocus();
                    _passwordFocusNode.unfocus();
                    _confirmPasswordFocusNode.unfocus();
                    if (_formKey.currentState!.validate()) {
                      context.read<RegisterCubit>().register(
                            RegisterRequestEntity(
                              fullname: _fullnameController.text,
                              block: _blockController.text,
                              phone: Utility.converPhone(_phoneController.text),
                              email: _emailController.text,
                              password: _passwordController.text,
                            ),
                          );
                    }
                  }
                },
                isLoading: state is RegisterLoading,
              );
            },
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account?",
                  style: AppTextStyle.mediumWhite,
                ),
                GestureDetector(
                  child: const Text(
                    ' Login',
                    style: AppTextStyle.bodyBoldWhite,
                  ),
                  onTap: () {
                    Get.offNamed('/login');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
