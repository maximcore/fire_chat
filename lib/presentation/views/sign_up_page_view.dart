import 'package:fire_chat/core/string_constants.dart';
import 'package:fire_chat/presentation/blocs/form_validation_bloc/form_validation_bloc.dart';
import 'package:fire_chat/presentation/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:fire_chat/presentation/blocs/sign_up_bloc/sign_up_bloc_state.dart';
import 'package:fire_chat/presentation/widgets/common/custom_elevated_button.dart';
import 'package:fire_chat/presentation/widgets/common/flavors_banner.dart';
import 'package:fire_chat/presentation/widgets/login_page/auth_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPageView extends StatelessWidget {
  const SignUpPageView({
    Key? key,
    required this.onLoginAnonymouslyPressed,
    required this.onSwitchSignTypePressed,
  }) : super(key: key);

  final VoidCallback onLoginAnonymouslyPressed;
  final VoidCallback onSwitchSignTypePressed;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FormValidationBloc(),
      child: BlocBuilder<SignUpBloc, SignUpBlocState>(
        builder: (context, state) {
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
                                onPressed: onLoginAnonymouslyPressed,
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
                                onPressed: onSwitchSignTypePressed,
                                child: Text(
                                  AppLocalization.haveAccount,
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.color,
                                  ),
                                ),
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
        },
      ),
    );
  }
}
