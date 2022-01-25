import 'package:fire_chat/core/string_constants.dart';
import 'package:fire_chat/presentation/blocs/form_validation_bloc/form_validation_bloc.dart';
import 'package:fire_chat/presentation/blocs/form_validation_bloc/form_validation_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({Key? key, required this.focusNode}) : super(key: key);

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
            initialValue: state.email.value,
            focusNode: focusNode,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              helperText: AppLocalization.emailFormatErrorHelperText,
              labelText: AppLocalization.emailLabelText,
              errorText: state.email.invalid
                  ? AppLocalization.emailFormatErrorHelperText
                  : null,
            ),
            onChanged: (value) {
              context.read<FormValidationBloc>().changeEmail(value);
            },
          ),
        );
      },
    );
  }
}
