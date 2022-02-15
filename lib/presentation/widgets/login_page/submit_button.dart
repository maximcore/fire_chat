import 'package:fire_chat/config/routing/routes.dart';
import 'package:fire_chat/core/string_constants.dart';
import 'package:fire_chat/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:fire_chat/presentation/blocs/auth_bloc/auth_bloc_state.dart';
import 'package:fire_chat/presentation/blocs/form_validation_bloc/form_validation_bloc.dart';
import 'package:fire_chat/presentation/blocs/form_validation_bloc/form_validation_state.dart';
import 'package:fire_chat/presentation/blocs/posts_bloc/posts_bloc.dart';
import 'package:fire_chat/presentation/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:fire_chat/presentation/blocs/sign_up_bloc/sign_up_bloc_state.dart';
import 'package:fire_chat/presentation/widgets/common/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:formz/formz.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    Key? key,
    required this.isLoginForm,
  }) : super(key: key);

  final bool isLoginForm;

  @override
  Widget build(BuildContext context) {
    return isLoginForm
        ? BlocConsumer<AuthBloc, AuthBlocState>(
            listener: (_, authState) {
              if (authState.status == AuthBlocStatus.loggedInAnonymously ||
                  authState.status ==
                      AuthBlocStatus.loggedInWithEmailAndPassword ||
                  authState.status == AuthBlocStatus.loggedInWithGoogle ||
                  authState.status == AuthBlocStatus.loggedInWithFacebook) {
                Navigator.of(context).pushReplacementNamed(
                  AppRoutes.homePageRoute,
                );
              } else if (authState.status == AuthBlocStatus.error) {
                Fluttertoast.showToast(
                  msg: authState.errorMessage!,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.transparent,
                  fontSize: 16,
                );
              }
            },
            builder: (_, authState) {
              return BlocBuilder<FormValidationBloc, FormValidationState>(
                buildWhen: (previous, current) =>
                    previous.status != current.status,
                builder: (context, state) {
                  return CustomElevatedButton(
                    onPressed: state.status.isValidated
                        ? () => onEnterPressed(
                              context: context,
                              state: state,
                            )
                        : null,
                    padding: 40,
                    radius: 16,
                    child: const Text(AppLocalization.loginButtonText),
                  );
                },
              );
            },
          )
        : BlocConsumer<SignUpBloc, SignUpBlocState>(
            listener: (_, signUpState) {
              if (signUpState.status == SignUpBlocStatus.ready) {
                Navigator.of(context).pushReplacementNamed(
                  AppRoutes.homePageRoute,
                );
              } else if (signUpState.status == SignUpBlocStatus.error) {
                Fluttertoast.showToast(
                  msg: signUpState.errorMessage!,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.transparent,
                  fontSize: 16,
                );
              }
            },
            builder: (_, signUpState) {
              return BlocBuilder<FormValidationBloc, FormValidationState>(
                buildWhen: (previous, current) =>
                    previous.status != current.status,
                builder: (context, state) {
                  return CustomElevatedButton(
                    onPressed: state.status.isValidated
                        ? () => onEnterPressed(
                              context: context,
                              state: state,
                            )
                        : null,
                    padding: 50,
                    radius: 16,
                    child: const Text(
                      AppLocalization.createAccount,
                    ),
                  );
                },
              );
            },
          );
  }

  void onEnterPressed({
    required BuildContext context,
    required FormValidationState state,
  }) {
    context.read<FormValidationBloc>().submit();

    isLoginForm
        ? onLoginSubmit(context, state)
        : onSignUpSubmit(context, state);
  }

  void onLoginSubmit(BuildContext context, FormValidationState state) {
    context.read<AuthBloc>().loginWithEmailAndPassword(
          email: state.email.value,
          password: state.password.value,
        );
    context.read<PostsBloc>().fetchPosts();
  }

  void onSignUpSubmit(
    BuildContext context,
    FormValidationState state,
  ) {
    try {
      context.read<SignUpBloc>().createUser(
            email: state.email.value,
            password: state.password.value,
          );
      context.read<AuthBloc>().loginWithEmailAndPasswordAfterSignUp(
            email: state.email.value,
            password: state.password.value,
          );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('account with this email is already registered'),
        ),
      );
      rethrow;
    }
  }
}
