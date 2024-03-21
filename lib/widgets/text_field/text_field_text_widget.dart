import 'package:flutter/material.dart';

class TextFieldNameWidget extends StatelessWidget {
  final String name;

  TextFieldNameWidget({required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: TextField(
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
