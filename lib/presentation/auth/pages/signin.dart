import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/configs/theme/app_colors.dart';
import 'package:flutter_movie_app/presentation/auth/pages/signup.dart';
import 'package:reactive_button/reactive_button.dart';
import 'package:flutter/gestures.dart';

import '../../../common/helper/navigation/app_navigator.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          minimum: const EdgeInsets.only(top: 100, right: 16, left: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _signInText(),
              const SizedBox(
                height: 30,
              ),
              _emailFieldText(),
              const SizedBox(
                height: 15,
              ),
              _passwordText(),
              const SizedBox(
                height: 60,
              ),
              _signinButton(),
              const SizedBox(
                height: 15,
              ),
              _signUpText(context)
            ],
          )),
    );
  }

  Widget _signInText() {
    return const Text(
      'Sign In',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    );
  }

  Widget _emailFieldText() {
    return const TextField(
      decoration: InputDecoration(hintText: 'Email'),
    );
  }

  Widget _passwordText() {
    return const TextField(
      decoration: InputDecoration(hintText: 'Password'),
    );
  }

  Widget _signinButton() {
    return ReactiveButton(title: 'Sign In', activeColor: AppColors.primary, onPressed: () async {}, onSuccess: () {}, onFailure: (error) {});
  }

  Widget _signUpText(BuildContext context) {
    return Text.rich(
      TextSpan(children: [
        const TextSpan(text: "Don't you have account ?"),
        TextSpan(
            text: "Sign Up",
            style: TextStyle(color: Colors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.push(context, SignUpPage());
              }),
      ]),
    );
  }
}
