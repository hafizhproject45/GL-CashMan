import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '/widgets/imagePicker_widget.dart';
import '/utils/color_pallete.dart';
import '/utils/text_styles.dart';

class PaymentScreen extends StatefulWidget {
  PaymentScreen({
    Key? key,
  });

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

//? FOR DROPDOWN
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
String? selectedValue;
final _formKey = GlobalKey<FormState>();

class _PaymentScreenState extends State<PaymentScreen> {
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
                    SizedBox(height: 30),
                    Container(
                      height: 1,
                      width: 350,
                      color: Colors.grey.withOpacity(0.3),
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: 300,
                      child: DropdownButtonFormField2<String>(
                        isExpanded: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 16),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: ColorPallete.primaryColor)),
                          // Add more decoration..
                        ),
                        hint: Text(
                          'Pilih Bulan',
                          style: TextPrimary.thin,
                        ),
                        items: monthItems
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ))
                            .toList(),
                        validator: (value) {
                          if (value == null) {
                            return 'Pilih Bulan';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          //Do something when selected item is changed.
                        },
                        onSaved: (value) {
                          selectedValue = value.toString();
                        },
                        buttonStyleData: ButtonStyleData(
                          padding: EdgeInsets.only(right: 8),
                        ),
                        iconStyleData: IconStyleData(
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: ColorPallete.primaryColor,
                          ),
                          iconSize: 24,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        menuItemStyleData: MenuItemStyleData(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                        ),
                      ),
                    ),
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
                          padding: EdgeInsets.symmetric(horizontal: 80),
                          backgroundColor: ColorPallete.primaryColor),
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
