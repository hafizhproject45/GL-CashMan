import 'package:flutter/material.dart';
import 'package:gl_app/styles/color_pallete.dart';

abstract class TextPrimary {
  static const TextStyle header = TextStyle(
    color: Colorz.primary,
    fontSize: 28,
    fontWeight: FontWeight.w900,
  );

  static const TextStyle subHeader = TextStyle(
    color: Colorz.primary,
    fontSize: 24,
    fontWeight: FontWeight.w800,
  );

  static const TextStyle body = TextStyle(
    color: Colorz.primary,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle thin = TextStyle(
    color: Colorz.primary,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
}

abstract class TextWhite {
  static const TextStyle header = TextStyle(
    color: Colors.white,
    fontSize: 24,
    fontWeight: FontWeight.w900,
  );

  static const TextStyle body = TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle thin = TextStyle(
    color: Colors.white,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
}

abstract class TextGrey {
  static const TextStyle header = TextStyle(
    color: Colors.grey,
    fontSize: 24,
    fontWeight: FontWeight.w900,
  );

  static const TextStyle body = TextStyle(
    color: Colors.grey,
    fontSize: 18,
    fontWeight: FontWeight.w500,
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
    fontWeight: FontWeight.w900,
  );

  static const TextStyle body = TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle thin = TextStyle(
    color: Colors.black,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
}
