import 'package:flutter/material.dart';
import 'package:mvvm/resources/colors.dart';
import 'package:mvvm/view_models/services/splash_services.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    SplashServices().checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            'Welcome',
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(color: AppColors.failedColor),
                Shadow(color: AppColors.successColor),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
