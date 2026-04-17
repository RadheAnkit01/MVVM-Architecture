import 'package:flutter/material.dart';
import 'package:mvvm/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier {
  Future<bool> saveUser(UserModel user) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    String userJson = userModelToJson(user);
    sp.setString('user', userJson);
    notifyListeners();
    return true;
  }

  Future<UserModel?> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();

    final String? userJson = sp.getString('user');

    if (userJson == null) {
      return null;
    }
    return userModelFromJson('user');
  }

  Future<bool> removeUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.remove('user');
    notifyListeners();

    return true;
  }
}
