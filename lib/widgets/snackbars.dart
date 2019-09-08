import 'package:flutter/material.dart';

class SuccessSnackBar extends SnackBar {
  SuccessSnackBar(String text, {int seconds = 5})
      : super(
          content: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
          duration: Duration(seconds: seconds),
          backgroundColor: Colors.green,
        );

  static void show(BuildContext context, String text, {int seconds = 5}) {
    Scaffold.of(context).showSnackBar(SuccessSnackBar(text, seconds: seconds));
  }
}

class ErrorSnackBar extends SnackBar {
  ErrorSnackBar(String text, {int seconds = 5})
      : super(
          content: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
          duration: Duration(seconds: seconds),
          backgroundColor: Colors.red,
        );

  static void show(BuildContext context, String text, {int seconds = 5}) {
    Scaffold.of(context).showSnackBar(ErrorSnackBar(text, seconds: seconds));
  }
}
