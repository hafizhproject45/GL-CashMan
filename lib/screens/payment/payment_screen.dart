import 'package:flutter/material.dart';
import 'package:gl_app/utils/color_pallete.dart';
import '/utils/text_styles.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(height: 30),
                  Text(
                    'Masukkan',
                    style: TextPrimary.thin,
                  ),
                  Text('Bukti Pembayaran', style: TextPrimary.header),
                  SizedBox(height: 30),
                  Container(
                    height: 1,
                    width: 350,
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  SizedBox(height: 30),
                  Container(
                    width: 300,
                    child: TextField(
                      enableInteractiveSelection: true,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        label: Text('Nama'),
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        fillColor: ColorPallete.primaryColor,
                        focusColor: ColorPallete.primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 300,
                    height: 300,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Simpan',
                    ),
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 80)),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
