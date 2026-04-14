import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view/home_view.dart';
import 'package:mvvm/view/login_view.dart';
import 'package:mvvm/view/signup_view.dart';

class Routes {
  static MaterialPageRoute<dynamic> generateRoutes(RouteSettings setting) {
    switch (setting.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => HomeView());
      case RoutesName.signin:
        return MaterialPageRoute(builder: (context) => LoginView());
      case RoutesName.signup:
        return MaterialPageRoute(builder: (context) => SignUpView());
      default:
        return MaterialPageRoute(
          builder: (context) =>
              Scaffold(body: Center(child: Text('No Page Defined'))),
        );
    }
  }
}
