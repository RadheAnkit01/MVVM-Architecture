import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class Utils {
  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.blue,
      // gravity: ToastGravity.BOTTOM_LEFT,
      // toastLength: Toast.LENGTH_LONG,
      timeInSecForIosWeb: 3,
      // webShowClose: false,
    );
  }

  static void flushBarErrorMessageWithTitle(
    String title,
    message,
    BuildContext context,
  ) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        title: title,
        message: message,
        backgroundColor: Colors.red,
        animationDuration: Duration(milliseconds: 500),
        duration: Duration(seconds: 2),
        icon: Icon(Icons.error_outline),
        dismissDirection: FlushbarDismissDirection.HORIZONTAL,
        flushbarStyle: FlushbarStyle.FLOATING,
        forwardAnimationCurve: Curves.decelerate,
        flushbarPosition: FlushbarPosition.TOP,
        borderRadius: BorderRadius.circular(20),
        margin: EdgeInsets.symmetric(horizontal: 10),
        // isDismissible: false,
      )..show(context),
    );
  }

  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        message: message,
        backgroundColor: Colors.red,
        animationDuration: Duration(milliseconds: 500),
        duration: Duration(seconds: 2),
        icon: Icon(Icons.error_outline),
        dismissDirection: FlushbarDismissDirection.HORIZONTAL,
        flushbarStyle: FlushbarStyle.FLOATING,
        forwardAnimationCurve: Curves.decelerate,
        flushbarPosition: FlushbarPosition.TOP,
        borderRadius: BorderRadius.circular(20),
        margin: EdgeInsets.symmetric(horizontal: 10),
      )..show(context),
    );
  }

  static showSnackbar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
    );
  }

  static ElevatedButton myElevetedButton(
    String text,
    void Function()? onPressed, {
    Color? bgColor = Colors.blue,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: Colors.white,
      ),
      onPressed: onPressed,
      child: Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
