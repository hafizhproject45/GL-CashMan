import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/utils/color_pallete.dart';
import '/utils/text_styles.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          //! ISI
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.symmetric(horizontal: 50, vertical: 230),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'LOGIN',
                  style: TextPrimary.header,
                ),
                SizedBox(height: 40),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: TextField(
                    enableInteractiveSelection: true,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        label: Text('Username'),
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10)),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: TextField(
                    enableInteractiveSelection: true,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                        label: Text('Password'),
                        border: OutlineInputBorder(),
                        suffix: Icon(Icons.remove_red_eye),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10)),
                  ),
                ),
                SizedBox(height: 30),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: ColorPallete.primaryColor,
                    minimumSize: Size(200, 0),
                  ),
                  onPressed: () {
                    context.go('/home');
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
