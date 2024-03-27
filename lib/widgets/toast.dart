import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void whiteToast({required String message}) {
  Fluttertoast.showToast(
    msg: message,
    textColor: Colors.black,
    backgroundColor: Colors.white,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    fontSize: 16.0,
  );
}

void blackToast({required String message}) {
  Fluttertoast.showToast(
    msg: message,
    textColor: Colors.white,
    backgroundColor: Colors.black,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    fontSize: 16.0,
  );
}

void successToast({required String message}) {
  Fluttertoast.showToast(
    msg: message,
    textColor: Colors.white,
    backgroundColor: Color.fromARGB(255, 10, 125, 13),
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    fontSize: 16.0,
  );
}

void dangerToast({required String message}) {
  Fluttertoast.showToast(
    msg: message,
    textColor: Colors.white,
    backgroundColor: Color.fromARGB(255, 173, 19, 8),
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    fontSize: 16.0,
  );
}

void warningToast({required String message}) {
  Fluttertoast.showToast(
    msg: message,
    textColor: Colors.black,
    backgroundColor: Colors.amber,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    fontSize: 16.0,
  );
}

void blueToast({required String message}) {
  Fluttertoast.showToast(
    msg: message,
    textColor: Colors.white,
    backgroundColor: Color.fromARGB(255, 8, 107, 188),
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    fontSize: 16.0,
  );
}
