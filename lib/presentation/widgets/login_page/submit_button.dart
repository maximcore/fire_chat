import 'package:fire_chat/core/string_constants.dart';
import 'package:fire_chat/presentation/blocs/form_validation_bloc/form_validation_bloc.dart';
import 'package:fire_chat/presentation/blocs/form_validation_bloc/form_validation_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormValidationBloc, FormValidationState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return ElevatedButton(
          onPressed: state.status.isValidated
              ? () => context.read<FormValidationBloc>().submit()
              : null,
          child: const Text(
            AppLocalization.loginButtonText,
          ),
        );
      },
    );
  }
}
