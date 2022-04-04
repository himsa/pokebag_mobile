import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarMethods {
  static void success(String message, [String title = "Success"]) {
    _showSnackBar(
      title: title,
      message: message,
      backgroundColor: Colors.greenAccent,
    );
  }

  static void warn(String message, [String title = "Note"]) {
    _showSnackBar(
      title: title,
      message: message,
      backgroundColor: Colors.orangeAccent,
    );
  }

  static void error(String message, [String title = "Error"]) {
    _showSnackBar(
      title: title,
      message: message,
      backgroundColor: Colors.redAccent,
    );
  }

  static void _showSnackBar({
    String? message,
    String? title,
    Color? backgroundColor,
    Color textColor = Colors.white,
  }) {
    Get.snackbar(
      title!,
      message!,
      backgroundColor: backgroundColor,
      colorText: textColor,
    );
  }
}
