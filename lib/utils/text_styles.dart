import 'package:flutter/material.dart';
import 'package:gl_app/utils/color_pallete.dart';

abstract class ThemeText {
  static const TextStyle headerTextPrimary = TextStyle(
    color: ColorPallete.primaryColor,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle bodyTextPrimary = TextStyle(
    color: ColorPallete.primaryColor,
    fontSize: 24,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle thinTextPrimary = TextStyle(
    color: ColorPallete.primaryColor,
    fontSize: 18,
  );
}
