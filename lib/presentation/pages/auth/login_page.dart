import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import '../../../core/utils/text_style.dart';

import '../../../core/utils/colors.dart';
import '../../widgets/text_field_auth/text_field_password_widget.dart';
import '../../widgets/text_field_auth/text_field_text_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Container(
                      width: screenWidth * 0.93,
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'LOGIN',
                            style: AppTextStyle.heading,
                          ),
                          const SizedBox(height: 40),
                          TextFieldTextWidget(
                            name: "Email",
                            iconz: Icons.email,
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
                          TextFieldPasswordWidget(
                            iconz: Icons.lock,
                            controller: _passwordController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Password tidak boleh kosong";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.primary,
                              fixedSize: const Size.fromWidth(250),
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                            ),
                            onPressed: () {
                              // if (_formKey.currentState!.validate()) {
                              //   _formKey.currentState!.save();
                              //   _login();
                              // }
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Don't have an account?",
                                  style: TextStyle(fontSize: 12),
                                ),
                                GestureDetector(
                                  child: const Text(
                                    ' Register',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.primary),
                                  ),
                                  onTap: () {
                                    Get.offNamed('/register');
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // void _login() async {
  //   setState(() {
  //     _isLoading = true;
  //   });

  //   String email = _emailController.text;
  //   String password = _passwordController.text;

  //   User? user = await _auth.signInWithEmailAndPassword(email, password);

  //   setState(() {
  //     _isLoading = false;
  //   });

  //   if (user != null) {
  //     Get.offNamed('/home');
  //   }
  // }
}
