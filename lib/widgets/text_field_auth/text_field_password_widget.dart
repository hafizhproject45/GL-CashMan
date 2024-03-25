import 'package:flutter/material.dart';

class TextFieldPasswordWidget extends StatefulWidget {
  final String? name;
  final TextEditingController? controller;
  final String? Function(String? value)? validator;

  TextFieldPasswordWidget({
    this.name,
    this.controller,
    this.validator,
  });

  @override
  State<TextFieldPasswordWidget> createState() =>
      _TextFieldPasswordWidgetState();
}

class _TextFieldPasswordWidgetState extends State<TextFieldPasswordWidget> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      width: 300,
      child: TextFormField(
        validator: widget.validator,
        controller: widget.controller,
        enableInteractiveSelection: true,
        keyboardType: TextInputType.text,
        obscureText: _obscureText,
        decoration: InputDecoration(
          labelText: widget.name ?? "Password",
          border: OutlineInputBorder(),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          fillColor: Colors.grey[200],
          filled: true,
        ),
      ),
    );
  }
}
