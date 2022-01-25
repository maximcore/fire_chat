import 'package:fire_chat/presentation/blocs/form_validation_bloc/form_validation_bloc.dart';
import 'package:fire_chat/presentation/blocs/form_validation_bloc/form_validation_state.dart';
import 'package:fire_chat/presentation/widgets/login_page/email_text_field.dart';
import 'package:fire_chat/presentation/widgets/login_page/password_text_field.dart';
import 'package:fire_chat/presentation/widgets/login_page/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener(() {
      if (!_emailFocusNode.hasFocus) {
        context.read<FormValidationBloc>().unfocusEmail();
        FocusScope.of(context).requestFocus(_passwordFocusNode);
      }
    });
    _passwordFocusNode.addListener(() {
      if (!_passwordFocusNode.hasFocus) {
        context.read<FormValidationBloc>().unfocusPassword();
      }
    });
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FormValidationBloc, FormValidationState>(
      listener: (context, state) {
        if (state.status.isSubmissionInProgress) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Submitting...')),
            );
        }
      },
      child: Column(
        children: <Widget>[
          EmailTextField(focusNode: _emailFocusNode),
          PasswordTextField(focusNode: _passwordFocusNode),
          const SubmitButton(),
        ],
      ),
    );
  }
}
