import 'package:flutter/material.dart';
import 'package:gl_app/styles/color_pallete.dart';
import 'package:gl_app/styles/text_styles.dart';

class TextFieldNormalWidget extends StatelessWidget {
  final String name;
  final TextEditingController? controller;
  final String? Function(String? value)? validator;

  TextFieldNormalWidget({
    required this.name,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: TextFormField(
        validator: validator,
        controller: controller,
        enableInteractiveSelection: true,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          label: Text(
            name,
            style: TextPrimary.thin,
          ),
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colorz.primary)),
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        ),
      ),
    );
  }
}
