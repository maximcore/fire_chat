import 'package:fire_chat/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInCredentialsRow extends StatelessWidget {
  const SignInCredentialsRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            context.read<AuthBloc>().loginWithGoogle();
          },
          icon: const FaIcon(FontAwesomeIcons.google),
        ),
        IconButton(
          onPressed: () {
            context.read<AuthBloc>().loginWithFacebook();
          },
          icon: const FaIcon(FontAwesomeIcons.facebook),
        ),
        const IconButton(
          onPressed: null,
          icon: FaIcon(FontAwesomeIcons.apple),
        ),
      ],
    );
  }
}
