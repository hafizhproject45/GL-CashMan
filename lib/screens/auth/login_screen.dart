import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../services/firebase_auth_services.dart';
import '../../widgets/text_field_auth/text_field_password_widget.dart';
import '../../widgets/text_field_auth/text_field_text_widget.dart';
import '../../styles/color_pallete.dart';
import '../../styles/text_styles.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FireBaseAuthService _auth = FireBaseAuthService();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;

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
          decoration: BoxDecoration(
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
                      padding: EdgeInsets.symmetric(vertical: 25),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'LOGIN',
                            style: TextPrimary.header,
                          ),
                          SizedBox(height: 40),
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
                          SizedBox(height: 20),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colorz.primary,
                              fixedSize: Size.fromWidth(250),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                            ),
                            onPressed: _isLoading
                                ? null
                                : () {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      _login();
                                    }
                                  },
                            child: _isLoading
                                ? CircularProgressIndicator(
                                    backgroundColor: Colors.white,
                                  )
                                : Text(
                                    'Login',
                                    style: TextStyle(color: Colors.white),
                                  ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account?",
                                  style: TextStyle(fontSize: 12),
                                ),
                                GestureDetector(
                                  child: Text(
                                    ' Register',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colorz.primary),
                                  ),
                                  onTap: () {
                                    context.go('/register');
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
              Positioned(
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

  void _login() async {
    setState(() {
      _isLoading = true;
    });

    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    setState(() {
      _isLoading = false;
    });

    if (user != null) {
      context.go('/home');
    }
  }
}
