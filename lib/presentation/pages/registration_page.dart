import 'dart:developer';

import 'package:fire_chat/config/routing/routes.dart';
import 'package:fire_chat/core/string_constants.dart';
import 'package:fire_chat/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:fire_chat/presentation/blocs/profile_existence_bloc/profile_existence_bloc.dart';
import 'package:fire_chat/presentation/widgets/common/custom_elevated_button.dart';
import 'package:fire_chat/presentation/widgets/common/flavors_banner.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({Key? key}) : super(key: key);

  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                        Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: TextField(
                            controller: _loginController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text(AppLocalization.loginLabelText),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: TextField(
                            controller: _passwordController,
                            decoration: const InputDecoration(
                              label: Text(AppLocalization.passwordLabelText),
                              border: OutlineInputBorder(),
                            ),
                            obscureText: true,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 16, right: 16),
                          color: Colors.white,
                          height: 64,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomElevatedButton(
                          onPressed: () {
                            context.read<ProfileExistenceBloc>().create();
                            context.read<AuthBloc>().login();
                            Navigator.pushNamed(
                              context,
                              AppRoutes.homePageRoute,
                            );
                          },
                          padding: 50,
                          radius: 16,
                          child: const Text(
                            AppLocalization.createAccount,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomElevatedButton(
                          onPressed: () async {
                            try {
                              await FirebaseAuth.instance.signInAnonymously();
                            } on FirebaseAuthException catch (error) {
                              log(error.toString());
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    error.toString(),
                                  ),
                                ),
                              );
                            } catch (error) {
                              log(error.toString());
                            }
                            Navigator.pushNamed(
                              context,
                              AppRoutes.homePageRoute,
                            );
                            // default behavior for my app - show login screen after logout
                          },
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
    );
  }
}
