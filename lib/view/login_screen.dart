import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
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
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutesName.home);
              },
              child: Text('Go to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
