import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../styles/color_pallete.dart';

void showToast({required String message}) {
  Fluttertoast.showToast(
    msg: message,
    textColor: Colors.white,
    backgroundColor: Colorz.primary,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    fontSize: 16.0,
  );
}
