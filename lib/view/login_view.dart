import 'package:flutter/material.dart';
import 'package:mvvm/utils/utils.dart';
// import 'package:mvvm/utils/routes/routes_name.dart';
// import 'package:mvvm/view/home_screen.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailTextController,
                keyboardType: TextInputType.emailAddress,
                focusNode: emailFocusNode,
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Email",
                  prefixIcon: Icon(Icons.alternate_email),
                ),
                onFieldSubmitted: (value) {
                  Utils.changeFieldFocus(
                    context,
                    emailFocusNode,
                    passwordFocusNode,
                  );
                },
              ),
              TextFormField(
                controller: _passwordTextController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                focusNode: passwordFocusNode,
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "*********",
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.visibility_off),
                ),
              ),
              //video part 8 -> 19 min done
            ],
          ),
        ),
      ),
    );
  }
}
