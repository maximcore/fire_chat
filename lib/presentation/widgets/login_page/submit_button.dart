import 'package:fire_chat/config/routing/routes.dart';
import 'package:fire_chat/core/string_constants.dart';
import 'package:fire_chat/domain/repositories/auth_repository/firebase_auth_repository.dart';
import 'package:fire_chat/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:fire_chat/presentation/blocs/auth_bloc/auth_bloc_state.dart';
import 'package:fire_chat/presentation/blocs/form_validation_bloc/form_validation_bloc.dart';
import 'package:fire_chat/presentation/blocs/form_validation_bloc/form_validation_state.dart';
import 'package:fire_chat/presentation/blocs/registration_bloc/registration_bloc.dart';
import 'package:fire_chat/presentation/blocs/registration_bloc/registration_bloc_state.dart';
import 'package:fire_chat/presentation/widgets/common/custom_elevated_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    Key? key,
    required this.isLoginForm,
  }) : super(key: key);

  final bool isLoginForm;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormValidationBloc, FormValidationState>(
      buildWhen: (previous, current) => previous.status != current.status,
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
          child: Text(
            isLoginForm
                ? AppLocalization.loginButtonText
                : AppLocalization.createAccount,
          ),
        );
      },
    );
  }

  void onEnterPressed({
    required BuildContext context,
    required FormValidationState state,
  }) {
    {
      context.read<FormValidationBloc>().submit();

      isLoginForm
          ? onLoginSubmit(context, state)
          : onRegistrationSubmit(context, state);

      Navigator.of(context).pushNamed(AppRoutes.homePageRoute);
    }
  }

  void onLoginSubmit(BuildContext context, FormValidationState state) {
    context.read<AuthBloc>().loginWithEmailAndPassword(
          email: state.email.value,
          password: state.password.value,
        );
  }

  void onRegistrationSubmit(
    BuildContext context,
    FormValidationState state,
  ) {
    context.read<RegistrationBloc>().createUser(
          email: state.email.value,
          password: state.password.value,
        );
    context.read<AuthBloc>().loginWithEmailAndPasswordAfterRegistration(
          email: state.email.value,
          password: state.password.value,
        );

    // TODO(Maxim): edit this part
    //print('user = ${context.read<RegistrationBloc>().state.user}');

    // context.read<AuthBloc>().loginWithEmailAndPasswordAfterRegistration(
    //       user: context.read<RegistrationBloc>().state.user!,
    //     );
  }
}
