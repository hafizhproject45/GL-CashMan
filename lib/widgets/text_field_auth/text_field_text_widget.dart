import 'package:flutter/material.dart';

class TextFieldTextWidget extends StatelessWidget {
  final String name;
  final TextEditingController? controller;
  final String? Function(String? value)? validator;

  TextFieldTextWidget({
    required this.name,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      width: 300,
      child: TextFormField(
        validator: validator,
        controller: controller,
        enableInteractiveSelection: true,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          label: Text(name),
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          fillColor: Colors.grey[200],
          filled: true,
        ),
      ),
    );
  }
}
