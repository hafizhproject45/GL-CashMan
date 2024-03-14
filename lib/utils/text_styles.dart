import 'package:flutter/material.dart';
import 'package:gl_app/utils/color_pallete.dart';

abstract class TextPrimary {
  static const TextStyle header = TextStyle(
    color: ColorPallete.primaryColor,
    fontSize: 24,
    fontWeight: FontWeight.w900,
  );

  static const TextStyle body = TextStyle(
    color: ColorPallete.primaryColor,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle thin = TextStyle(
    color: ColorPallete.primaryColor,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
}

abstract class TextGrey {
  static const TextStyle header = TextStyle(
    color: Colors.grey,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle body = TextStyle(
    color: Colors.grey,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle thin = TextStyle(
    color: Colors.grey,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
}

abstract class TextBlack {
  static const TextStyle header = TextStyle(
    color: Colors.black,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle body = TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle thin = TextStyle(
    color: Colors.black,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
}
