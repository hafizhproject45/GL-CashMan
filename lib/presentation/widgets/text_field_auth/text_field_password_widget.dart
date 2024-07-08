import 'package:flutter/material.dart';

class TextFieldPasswordWidget extends StatefulWidget {
  final String? name;
  final IconData? iconz;
  final TextEditingController? controller;
  final String? Function(String? value)? validator;

  const TextFieldPasswordWidget({super.key, 
    this.name,
    this.controller,
    this.validator,
    this.iconz,
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
      padding: const EdgeInsets.symmetric(vertical: 5),
      width: 250,
      child: TextFormField(
        validator: widget.validator,
        controller: widget.controller,
        enableInteractiveSelection: true,
        keyboardType: TextInputType.text,
        obscureText: _obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.iconz),
          labelText: widget.name ?? "Password",
          border: const OutlineInputBorder(),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          fillColor: Colors.grey[200],
          filled: true,
        ),
      ),
    );
  }
}
