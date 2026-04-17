import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/model/user_model.dart';
import 'package:mvvm/resources/colors.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_models/user_view_model.dart';

class SplashServices {
  Future<UserModel?> getUserData() => UserViewModel().getUser();
  // Future<bool?> saveUserData() => UserViewModel().saveUser();

  void checkAuthentication(BuildContext context) async {
    final value = await getUserData();
    try {
      if (value?.token == null || value!.token.isEmpty) {
        Utils.flushBarErrorMessage(
          'Redirecting to SignIn',
          context,
          bgColor: AppColors.successColor,
        );
        await Future.delayed(Duration(seconds: 2));
        Navigator.pushReplacementNamed(context, RoutesName.signin);
      } else {
        Utils.flushBarErrorMessage(
          'Redirecting to Home',
          context,
          bgColor: AppColors.successColor,
        );
        await Future.delayed(Duration(seconds: 2));
        Navigator.pushReplacementNamed(context, RoutesName.home);
      }
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
  }
}
