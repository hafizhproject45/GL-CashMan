// ignore_for_file: no_leading_underscores_for_local_identifiers, library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/text_style.dart';

class MyTextFieldText extends StatefulWidget {
  final String name;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final TextInputType? type;
  final TextStyle? nameStyle;
  final bool? isDate;
  final double? width;
  final IconData? iconz;
  final Color? iconColor;
  final TextEditingController? controller;
  final String? Function(String? value)? validator;

  const MyTextFieldText({
    super.key,
    required this.name,
    this.focusNode,
    this.isDate = false,
    this.textInputAction,
    this.nameStyle,
    this.iconz,
    this.iconColor,
    this.controller,
    this.validator,
    this.width = 300,
    this.type = TextInputType.text,
  });

  @override
  _MyTextFieldTextState createState() => _MyTextFieldTextState();
}

class _MyTextFieldTextState extends State<MyTextFieldText> {
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      width: widget.width,
      child: TextFormField(
        validator: widget.validator,
        cursorColor: AppColor.white,
        controller: widget.controller,
        focusNode: widget.isDate! ? null : widget.focusNode,
        textInputAction: widget.isDate! ? null : widget.textInputAction,
        enableInteractiveSelection: !widget.isDate!,
        keyboardType: widget.isDate! ? null : widget.type,
        readOnly: widget.isDate!,
        style: widget.nameStyle ?? AppTextStyle.bodyThinWhite,
        onTap: widget.isDate!
            ? () async {
                DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: _selectedDate ?? DateTime.now(),
                  firstDate: DateTime(2024),
                  lastDate: DateTime(DateTime.now().year + 1),
                  builder: (BuildContext context, Widget? child) {
                    return Theme(
                      data: ThemeData.light().copyWith(
                        colorScheme: const ColorScheme.light(
                          primary: AppColor.primary,
                          onPrimary: Colors.white,
                          surface: Colors.white,
                          onSurface: Colors.black,
                        ),
                        dialogBackgroundColor: Colors.white,
                      ),
                      child: child!,
                    );
                  },
                );
                if (picked != null) {
                  setState(() {
                    _selectedDate = picked;
                  });
                  if (widget.controller != null) {
                    widget.controller!.text = picked.toString().split(" ")[0];
                  }
                }
              }
            : null,
        decoration: InputDecoration(
          errorStyle: const TextStyle(color: Colors.red),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          prefixIcon: Icon(
            widget.iconz,
            color: widget.iconColor ?? AppColor.white,
          ),
          label: Text(
            widget.name,
            style: widget.nameStyle ?? AppTextStyle.bodyThinWhite,
          ),
          border: const OutlineInputBorder(),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        ),
      ),
    );
  }
}
