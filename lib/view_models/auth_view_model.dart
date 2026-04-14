import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/repository/auth_repository.dart';
import 'package:mvvm/resources/colors.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;
  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApiCall(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo
        .signInApi(data)
        .then((value) {
          setLoading(false);
          if (value['error'] != null) {
            Utils.flushBarErrorMessage(
              'User Not Found',
              context,
              bgColor: AppColors.failedColor,
            );
            if (kDebugMode) {
              // print("from loginapicall " + value.toString());
            }
          } else {
            Utils.flushBarErrorMessage(
              'Login Success',
              context,
              bgColor: AppColors.successColor,
            );
            Navigator.pushNamed(context, RoutesName.home);
            if (kDebugMode) {
              // print("from loginapicall " + value.toString());
            }
          }
        })
        .onError((error, stackTrace) {
          setLoading(false);
          Utils.flushBarErrorMessage(error.toString(), context);
          if (kDebugMode) {
            // print("from loginapicall on error : " + error.toString());
          }
        });
  }

  Future<void> signUpApiCall(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo
        .signUpApi(data)
        .then((value) {
          setLoading(false);
          // print("Printed from signIpApiCall :" + value.toString());
          if (value['error'] != null) {
            Utils.flushBarErrorMessage(
              'Only defined users succeed registration',
              context,
              bgColor: AppColors.failedColor,
            );
            if (kDebugMode) {
              // print("from loginapicall " + value.toString());
            }
          } else {
            Utils.flushBarErrorMessage(
              'SignUp Success',
              context,
              bgColor: AppColors.successColor,
            );
            Navigator.pushNamed(context, RoutesName.home);
            if (kDebugMode) {
              // print("from signUpApiCall " + value.toString());
            }
          }
        })
        .onError((error, stackTrace) {
          setLoading(false);
          Utils.flushBarErrorMessage(error.toString(), context);
          if (kDebugMode) {
            // print("from loginapicall on error : " + error.toString());
          }
        });
  }
}
