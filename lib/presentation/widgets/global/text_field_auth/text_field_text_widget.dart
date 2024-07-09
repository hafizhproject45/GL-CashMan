// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/text_style.dart';

class MyTextFieldText extends StatelessWidget {
  final String name;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final TextInputType? type;
  final bool? isDate;
  final double? width;
  final IconData? iconz;
  final TextEditingController? controller;
  final String? Function(String? value)? validator;

  const MyTextFieldText({
    super.key,
    required this.name,
    this.focusNode,
    this.isDate = false,
    this.textInputAction,
    this.iconz,
    this.controller,
    this.validator,
    this.width = 300,
    this.type = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      width: width,
      child: TextFormField(
        validator: validator,
        cursorColor: AppColor.white,
        controller: controller,
        focusNode: isDate! ? null : focusNode,
        textInputAction: isDate! ? null : textInputAction,
        enableInteractiveSelection: !isDate!,
        keyboardType: isDate! ? null : type,
        readOnly: isDate!,
        style: AppTextStyle.bodyThinWhite,
        onTap: isDate!
            ? () async {
                DateTime? _picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1500),
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
                if (_picked != null && controller != null) {
                  controller!.text = _picked.toString().split(" ")[0];
                }
              }
            : null,
        decoration: InputDecoration(
          errorStyle: const TextStyle(color: Colors.red),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          prefixIcon: Icon(
            iconz,
            color: AppColor.white,
          ),
          label: Text(
            name,
            style: AppTextStyle.bodyThinWhite,
          ),
          border: const OutlineInputBorder(),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        ),
      ),
    );
  }
}
