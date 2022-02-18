import 'package:fire_chat/config/routing/routes.dart';
import 'package:fire_chat/presentation/views/sign_in_view.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  void goToSignUpForm(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(
      AppRoutes.signUpPageRoute,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SignInPageView(
      onPressed: () => goToSignUpForm(context),
    );
  }
}
