import 'package:flutter/material.dart';
import 'package:mvvm/resources/components/round_button.dart';
import 'package:mvvm/utils/utils.dart';
// import 'package:mvvm/utils/routes/routes_name.dart';
// import 'package:mvvm/view/home_screen.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final ValueNotifier _obsecurePassword = ValueNotifier<bool>(false);

  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  @override
  void dispose() {
    super.dispose();
    _emailTextController.dispose();
    _passwordTextController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    _obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
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
              ValueListenableBuilder(
                valueListenable: _obsecurePassword,
                builder: (BuildContext context, dynamic value, Widget? child) {
                  return TextFormField(
                    controller: _passwordTextController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _obsecurePassword.value,
                    focusNode: passwordFocusNode,
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "*********",
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: InkWell(
                        onTap: () {
                          _obsecurePassword.value = !_obsecurePassword.value;
                        },
                        child: _obsecurePassword.value
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: height * .1),
              RoundButton(
                text: 'Sign In',
                onPressed: () {
                  if (_emailTextController.text.isEmpty ||
                      _passwordTextController.text.isEmpty) {
                    Utils.flushBarErrorMessageWithTitle(
                      'Empty Credentials',
                      'Please Fill Credentials to Proceed',
                      context,
                    );
                  } else if (_passwordTextController.text.length < 8) {
                    Utils.flushBarErrorMessageWithTitle(
                      "Password Length Error",
                      'Password Length should not be less than 8 characters',
                      context,
                    );
                  } else {
                    print('Api Hit');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
