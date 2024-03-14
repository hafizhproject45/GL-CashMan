import 'package:flutter/material.dart';
import 'package:gl_app/utils/color_pallete.dart';
import 'package:gl_app/utils/text_styles.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(height: 30),
                Text(
                  'Selamat datang di ',
                  style: ThemeText.thinTextPrimary,
                ),
                Text(
                  'Aplikasi GL Manager',
                  style: TextStyle(
                      color: ColorPallete.primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.all(20),
                  height: 100,
                  child: Column(
                    children: [],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
