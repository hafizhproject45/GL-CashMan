import 'package:flutter/material.dart';
import 'package:gl_app/utils/text_styles.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({
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
                  'Payment',
                  style: ThemeText.headerTextPrimary,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
