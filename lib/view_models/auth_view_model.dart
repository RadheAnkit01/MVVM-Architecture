import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/repository/auth_repository.dart';
import 'package:mvvm/resources/colors.dart';
import 'package:mvvm/utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  Future<void> loginApiCall(dynamic data, BuildContext context) async {
    _myRepo
        .loginApi(data)
        .then((value) {
          if (value['error'] != null) {
            Utils.flushBarErrorMessage(
              'User Not Found',
              context,
              bgColor: AppColors.failedColor,
            );
            if (kDebugMode) {
              print("from loginapicall " + value.toString());
            }
          } else {
            Utils.flushBarErrorMessage(
              'Login Successfull',
              context,
              bgColor: AppColors.successColor,
            );
            if (kDebugMode) {
              print("from loginapicall " + value.toString());
            }
          }
        })
        .onError((error, stackTrace) {
          Utils.flushBarErrorMessage(error.toString(), context);
          if (kDebugMode) {
            print("from loginapicall on error : " + error.toString());
          }
        });
  }
}
