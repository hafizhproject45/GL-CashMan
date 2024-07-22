import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

import '../../../core/utils/text_style.dart';
import '../../../core/utils/toast.dart';
import '../../../domain/entities/auth/register_request_entity.dart';
import '../../cubit/auth/register/register_cubit.dart';
import '../global/button/my_button_widget.dart';
import '../global/text_field_auth/text_field_password_widget.dart';
import '../global/text_field_auth/text_field_text_widget.dart';

class RegisterFormSection extends StatefulWidget {
  const RegisterFormSection({super.key});

  @override
  State<RegisterFormSection> createState() => _RegisterFormSectionState();
}

class _RegisterFormSectionState extends State<RegisterFormSection> {
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _blockController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final FocusNode _fullnameFocusNode = FocusNode();
  final FocusNode _blockFocusNode = FocusNode();
  final FocusNode _contactFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _fullnameController.dispose();
    _blockController.dispose();
    _contactController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _fullnameFocusNode.dispose();
    _blockFocusNode.dispose();
    _contactFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Form(
      key: _formKey,
      child: Container(
        width: screenWidth * 0.93,
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'REGISTER',
              style: AppTextStyle.headingWhite,
            ),
            const SizedBox(height: 30),
            MyTextFieldText(
              name: "Nama Lengkap",
              iconz: Icons.person,
              textInputAction: TextInputAction.next,
              type: TextInputType.name,
              focusNode: _fullnameFocusNode,
              controller: _fullnameController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Nama Lengkap tidak boleh kosong";
                } else if (value.length > 50) {
                  return "Nama Lengkap terlalu panjang";
                }
                return null;
              },
            ),
            MyTextFieldText(
              name: "Nomor rumah",
              iconz: Icons.home_work_rounded,
              type: TextInputType.streetAddress,
              textInputAction: TextInputAction.next,
              focusNode: _blockFocusNode,
              controller: _blockController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Nomor rumah tidak boleh kosong";
                } else if (value.length > 5) {
                  return "Nomor rumah tidak valid";
                }
                return null;
              },
            ),
            MyTextFieldText(
              name: "Nomor Handphone",
              iconz: Icons.phone_android,
              textInputAction: TextInputAction.next,
              type: TextInputType.phone,
              focusNode: _contactFocusNode,
              controller: _contactController,
              validator: (value) {
                String pattern = r'(^[0-9]{10,15}$)';
                RegExp regExp = RegExp(pattern);

                if (value!.isEmpty) {
                  return "Kontak tidak boleh kosong";
                } else if (!regExp.hasMatch(value)) {
                  return "Kontak tidak valid";
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
              validator: (value) {
                String pattern =
                    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                RegExp regex = RegExp(pattern);

                if (value!.isEmpty) {
                  return 'Email tidak boleh kosong';
                } else if (!regex.hasMatch(value)) {
                  return 'Email tidak valid';
                }
                return null;
              },
            ),
            MyTextFieldPassword(
              iconz: Icons.lock,
              textInputAction: TextInputAction.next,
              focusNode: _passwordFocusNode,
              controller: _passwordController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Password tidak boleh kosong";
                } else if (value.length < 6) {
                  return "Password minimal 6 karakter";
                } else if (value.length >= 30) {
                  return "Password maksimal 30 karakter";
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
              validator: (value) {
                if (value!.isEmpty) {
                  return "Confirm Password tidak boleh kosong";
                } else if (value.length < 6) {
                  return "Password minimal 6 karakter";
                } else if (_passwordController.text !=
                    _confirmPasswordController.text) {
                  return "Password harus sama";
                } else if (value.length >= 30) {
                  return "Password maksimal 30 karakter";
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
                  successToast(msg: 'Berhasil membuat akun');
                }
              },
              builder: (context, state) {
                return MyButtonWidget(
                  label: 'REGISTER',
                  onPressed: () {
                    _fullnameController.text = 'Hafizh Project';
                    _blockController.text = '88 B';
                    _contactController.text = '085175435207';
                    _emailController.text = 'hafizh.project45@gmail.com';
                    _passwordController.text = 'akunhafizh45';
                    _confirmPasswordController.text = 'akunhafizh45';

                    if (state is! RegisterLoading) {
                      _fullnameFocusNode.unfocus();
                      _blockFocusNode.unfocus();
                      _contactFocusNode.unfocus();
                      _emailFocusNode.unfocus();
                      _passwordFocusNode.unfocus();
                      _confirmPasswordFocusNode.unfocus();
                      if (_formKey.currentState!.validate()) {
                        context.read<RegisterCubit>().register(
                              RegisterRequestEntity(
                                fullname: _fullnameController.text,
                                block: _blockController.text,
                                contact: _contactController.text,
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
      ),
    );
  }
}
