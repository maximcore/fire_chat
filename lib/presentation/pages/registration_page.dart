import 'dart:developer';

import 'package:fire_chat/config/routing/routes.dart';
import 'package:fire_chat/core/string_constants.dart';
import 'package:fire_chat/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:fire_chat/presentation/blocs/form_validation_bloc/form_validation_bloc.dart';
import 'package:fire_chat/presentation/blocs/registration_bloc/registration_bloc.dart';
import 'package:fire_chat/presentation/widgets/common/custom_elevated_button.dart';
import 'package:fire_chat/presentation/widgets/common/flavors_banner.dart';
import 'package:fire_chat/presentation/widgets/login_page/auth_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FormValidationBloc(),
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: const Text(AppLocalization.createUserPageTitle),
              centerTitle: true,
            ),
            body: SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints(minHeight: constraints.maxHeight),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Icon(
                            Icons.person_pin,
                            size: 64,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const LoginForm(
                            isLoginForm: false,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomElevatedButton(
                            onPressed: () => onLoginAnonymouslyPressed(context),
                            padding: 50,
                            radius: 16,
                            child: const Text(
                              AppLocalization.loginAnonymously,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacementNamed(
                                AppRoutes.loginPageRoute,
                              );
                            },
                            child: const Text(AppLocalization.haveAccount),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const FlavorsBanner(),
        ],
      ),
    );
  }

  void onCreatePressed(BuildContext context) {
    Navigator.pushNamed(
      context,
      AppRoutes.homePageRoute,
    );
  }

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
}
