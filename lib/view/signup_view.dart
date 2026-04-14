import 'package:flutter/material.dart';
import 'package:mvvm/resources/components/round_button.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_models/auth_view_model.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final ValueNotifier _obsecurePassword = ValueNotifier<bool>(true);
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    _obsecurePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailTextController,
                // initialValue: "eve.holt@reqres.in",
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
                    // initialValue: "cityslicka",
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
                text: 'Sign Up',
                loading: authViewModel.loading,
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
                    Map data = {
                      "email": _emailTextController.text,
                      "password": _passwordTextController.text,
                    };
                    authViewModel.signUpApiCall(data, context);
                  }
                },
              ),
              SizedBox(height: height * .02),
              InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(context, RoutesName.signin);
                },
                child: Text("Already have account? Sign In"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
