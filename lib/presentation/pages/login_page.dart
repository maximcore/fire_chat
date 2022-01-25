import 'package:fire_chat/config/routing/routes.dart';
import 'package:fire_chat/core/string_constants.dart';
import 'package:fire_chat/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:fire_chat/presentation/blocs/form_validation_bloc/form_validation_bloc.dart';
import 'package:fire_chat/presentation/widgets/common/custom_elevated_button.dart';
import 'package:fire_chat/presentation/widgets/common/flavors_banner.dart';
import 'package:fire_chat/presentation/widgets/login_page/email_text_field.dart';
import 'package:fire_chat/presentation/widgets/login_page/login_form.dart';
import 'package:fire_chat/presentation/widgets/login_page/password_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FormValidationBloc(),
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: const Text(AppLocalization.loginPageTitle),
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
                          // const Padding(
                          //   padding: EdgeInsets.only(left: 16, right: 16),
                          //   child: EmailTextField(),
                          // ),
                          // const SizedBox(
                          //   height: 8,
                          // ),
                          // const Padding(
                          //   padding: EdgeInsets.only(left: 16, right: 16),
                          //   child: PasswordTextField(),
                          // ),
                          // const SizedBox(
                          //   height: 8,
                          // ),
                          // CustomElevatedButton(
                          //   onPressed: () {
                          //     context.read<AuthBloc>()
                          //         .loginWithEmailAndPassword(
                          //       email: _loginController.text,
                          //       password: _passwordController.text,
                          //     );
                          //     Navigator.pushNamed(
                          //       context,
                          //       AppRoutes.homePageRoute,
                          //     );
                          //   },
                          //   padding: 50,
                          //   radius: 16,
                          //   child: const Text(
                          //     AppLocalization.loginButtonText,
                          //   ),
                          // ),
                          const LoginForm(),
                          const SizedBox(
                            height: 8,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacementNamed(
                                AppRoutes.registrationPageRoute,
                              );
                            },
                            child: const Text(AppLocalization.noAccount),
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
}
