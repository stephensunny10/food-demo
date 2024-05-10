import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Functions {
  static void showSuccessToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static void showErrorToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static void showLoader(BuildContext context, String message) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dialog from being dismissed by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(), // Show circular progress indicator
              const SizedBox(height: 16.0),
              Text(message), // Show loading message
            ],
          ),
        );
      },
    );
  }

  static void hideLoader(BuildContext context) {
    Navigator.of(context).pop(); // Close the dialog
  }

}
