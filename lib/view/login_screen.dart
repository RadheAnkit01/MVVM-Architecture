import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';
// import 'package:mvvm/view/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Utils.myElevetedButton('Show toast message', () {
              Utils.toastMessage('This is yoour toast message');
            }),

            Utils.myElevetedButton('Show SnackBar Message', () {
              Utils.showSnackbar("No internet connection", context);
            }),

            Utils.myElevetedButton('Show Flush Bar Message', () {
              Utils.flushBarErrorMessageWithTitle(
                "No internet connection",
                "Turn On Internet First",
                context,
              );
            }),

            Utils.myElevetedButton('Go to Home Screen', () {
              Navigator.pushNamed(context, RoutesName.home);
            }, bgColor: Colors.red),
          ],
        ),
      ),
    );
  }
}
