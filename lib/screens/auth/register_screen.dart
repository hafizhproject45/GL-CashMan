import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../controller/C_Auth.dart';
import '../../models/M_User.dart';
import '../../widgets/toast.dart';
import '../../widgets/text_field_auth/text_field_password_widget.dart';
import '../../widgets/text_field_auth/text_field_text_widget.dart';
import '../../styles/color_pallete.dart';
import '../../styles/text_styles.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final C_Auth _auth = C_Auth();

  TextEditingController _fullnameController = TextEditingController();
  TextEditingController _blockController = TextEditingController();
  TextEditingController _contactController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  bool _isLoading = false; // variabel untuk mengontrol status loading

  @override
  void dispose() {
    _fullnameController.dispose();
    _blockController.dispose();
    _contactController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
                      padding: EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'REGISTER',
                            style: TextPrimary.header,
                          ),
                          SizedBox(height: 30),
                          TextFieldTextWidget(
                            name: "Nama Lengkap",
                            iconz: Icons.person_pin_sharp,
                            controller: _fullnameController,
                            validator: (value) {
                              String pattern = r'(^[a-zA-Z\s]*$)';
                              RegExp regExp = new RegExp(pattern);
                              if (value!.isEmpty) {
                                return "Nama Lengkap tidak boleh kosong";
                              } else if (!regExp.hasMatch(value)) {
                                return "Nama Lengkap tidak boleh berisi angka";
                              }
                              return null;
                            },
                          ),
                          TextFieldTextWidget(
                            name: "Nomor rumah",
                            iconz: Icons.home_work_rounded,
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
                          TextFieldTextWidget(
                            name: "Nomor Handphone",
                            iconz: Icons.phone_android,
                            controller: _contactController,
                            validator: (value) {
                              String pattern = r'(^[0-9]{10,15}$)';
                              RegExp regExp = new RegExp(pattern);

                              if (value!.isEmpty) {
                                return "Kontak tidak boleh kosong";
                              } else if (!regExp.hasMatch(value)) {
                                return "Kontak tidak valid";
                              }
                              return null;
                            },
                          ),
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
                              } else if (value.length < 6) {
                                return "Password minimal 6 karakter";
                              } else if (value.length >= 30) {
                                return "Password maksimal 30 karakter";
                              }
                              return null;
                            },
                          ),
                          TextFieldPasswordWidget(
                            name: "Confirm Password",
                            iconz: Icons.lock,
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
                                      _createData(M_User(
                                        fullname: _fullnameController.text,
                                        block: _blockController.text,
                                        contact: _contactController.text,
                                        email: _emailController.text,
                                      ));
                                    }
                                  },
                            child: _isLoading
                                ? Container(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.white),
                                    ),
                                  )
                                : Text(
                                    'Register',
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
                                  "Already have an account?",
                                  style: TextStyle(fontSize: 12),
                                ),
                                GestureDetector(
                                  child: Text(
                                    ' Login',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colorz.primary),
                                  ),
                                  onTap: () {
                                    context.go('/login');
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
                      fontSize: 10,
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

  void _register() async {
    setState(() {
      _isLoading = true;
    });

    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    setState(() {
      _isLoading = false;
    });

    if (user != null) {
      successToast(message: "Berhasil membuat akun");
      context.go('/login');
    } else {}
  }

  Future<void> _createData(M_User userModel) async {
    final userCollection = FirebaseFirestore.instance.collection("users");

    DateTime dateTimeNow = DateTime.now();
    String dateWithTime =
        DateFormat('dd-MMM-yyyy HH:mm:ss').format(dateTimeNow);

    String id = userCollection.doc().id;

    final newUser = M_User(
      id: id,
      fullname: userModel.fullname,
      block: userModel.block,
      contact: userModel.contact,
      email: userModel.email,
      createdAt: dateWithTime,
      updateAt: dateWithTime,
    ).toJson();

    try {
      await userCollection.doc(userModel.email).set(newUser);
      _register();
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
