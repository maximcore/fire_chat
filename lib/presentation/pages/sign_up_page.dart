import 'dart:developer';

import 'package:fire_chat/config/routing/routes.dart';
import 'package:fire_chat/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:fire_chat/presentation/views/sign_up_page_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  void onLoginAnonymouslyPressed(BuildContext context) {
    try {
      context.read<AuthBloc>().loginAnonymously();
      Navigator.pushNamed(
        context,
        AppRoutes.homePageRoute,
      );
    } on FirebaseAuthException catch (error) {
      log(error.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            error.message.toString(),
          ),
        ),
      );
    } catch (error) {
      log(error.toString());
    }
  }

  void onSwitchSignTypePressed(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(
      AppRoutes.loginPageRoute,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SignUpPageView(
      onLoginAnonymouslyPressed: () => onLoginAnonymouslyPressed(context),
      onSwitchSignTypePressed: () => onSwitchSignTypePressed(context),
    );
  }
}
