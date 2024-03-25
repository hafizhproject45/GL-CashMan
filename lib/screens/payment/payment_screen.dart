import 'package:flutter/material.dart';
import 'package:gl_app/widgets/text_field_normal/text_field_normal_widget.dart';

import '../../widgets/dropdown_widget.dart';
import '../../widgets/imagePicker_widget.dart';
import '../../styles/color_pallete.dart';
import '../../styles/text_styles.dart';

class PaymentScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  PaymentScreen({Key? key});

  final List<String> monthItems = [
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember ',
  ];

  final List<String> yearItems = [
    '2024',
    '2025',
    '2026',
    '2027',
    '2028',
    '2029',
    '2030',
  ];

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
                    Text('Bukti Pembayaran', style: TextPrimary.header),
                    SizedBox(height: 20),
                    Container(
                      height: 1,
                      width: 350,
                      color: Colors.grey.withOpacity(0.3),
                    ),
                    SizedBox(height: 20),
                    TextFieldNormalWidget(
                      name: "Nama Lengkap",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Masukkan Nama Lengkap";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFieldNormalWidget(
                      name: "Blok",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Masukkan Blok";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        DropDownWidget(name: "Bulan", items: monthItems),
                        SizedBox(width: 8),
                        DropDownWidget(name: "Tahun", items: yearItems),
                      ],
                    ),
                    SizedBox(height: 20),
                    ImagePickerWidget(),
                    SizedBox(height: 30),
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
                    ),
                    SizedBox(height: 50),
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
