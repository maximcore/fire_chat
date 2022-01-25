import 'package:fire_chat/core/string_constants.dart';
import 'package:fire_chat/presentation/blocs/form_validation_bloc/form_validation_bloc.dart';
import 'package:fire_chat/presentation/blocs/form_validation_bloc/form_validation_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({Key? key, required this.focusNode})
      : super(key: key);

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormValidationBloc, FormValidationState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(
            left: 32,
            right: 32,
            bottom: 8,
          ),
          child: TextFormField(
            initialValue: state.password.value,
            focusNode: focusNode,
            obscureText: true,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              helperText: AppLocalization.passwordFormatErrorHelperText,
              labelText: AppLocalization.passwordLabelText,
              errorText: state.password.invalid
                  ? AppLocalization.passwordFormatErrorHelperText
                  : null,
            ),
            onChanged: (value) {
              context.read<FormValidationBloc>().changePassword(value);
            },
          ),
        );
      },
    );
  }
}
