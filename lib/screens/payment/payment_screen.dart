import 'package:flutter/material.dart';
import 'package:gl_app/widgets/dropdown_widget.dart';

import '../../widgets/imagePicker_widget.dart';
import '../../styles/color_pallete.dart';
import '../../styles/text_styles.dart';

class PaymentScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  PaymentScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    Text(
                      'Masukkan',
                      style: TextPrimary.thin,
                    ),
                    Text('Bukti Pembayaran 2024', style: TextPrimary.header),
                    SizedBox(height: 30),
                    Container(
                      height: 1,
                      width: 350,
                      color: Colors.grey.withOpacity(0.3),
                    ),
                    SizedBox(height: 30),
                    DropDownWidget(),
                    SizedBox(height: 20),
                    ImagePickerWidget(),
                    SizedBox(height: 50),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                        }
                      },
                      child: Text(
                        'Simpan',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colorz.primary,
                        fixedSize: Size.fromWidth(310),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
