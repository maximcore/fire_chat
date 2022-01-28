import 'package:fire_chat/config/routing/routes.dart';
import 'package:fire_chat/core/string_constants.dart';
import 'package:fire_chat/presentation/blocs/form_validation_bloc/form_validation_bloc.dart';
import 'package:fire_chat/presentation/widgets/common/flavors_banner.dart';
import 'package:fire_chat/presentation/widgets/login_page/auth_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FormValidationBloc(),
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
                          const LoginForm(
                            isLoginForm: true,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacementNamed(
                                AppRoutes.signUpPageRoute,
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
