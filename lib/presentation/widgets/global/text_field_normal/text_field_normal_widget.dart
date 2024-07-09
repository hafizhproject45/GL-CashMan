import 'package:flutter/material.dart';
import '../../../../core/utils/text_style.dart';

import '../../../../core/utils/colors.dart';

class TextFieldNormalWidget extends StatelessWidget {
  final String name;
  final TextEditingController? controller;
  final String? Function(String? value)? validator;

  const TextFieldNormalWidget({
    super.key,
    required this.name,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextFormField(
        validator: validator,
        controller: controller,
        enableInteractiveSelection: true,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          label: Text(
            name,
            style: AppTextStyle.medium,
          ),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.primary)),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        ),
      ),
    );
  }
}
