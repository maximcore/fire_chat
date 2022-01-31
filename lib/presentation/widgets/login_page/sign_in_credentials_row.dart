import 'package:fire_chat/core/string_constants.dart';
import 'package:fire_chat/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:fire_chat/presentation/widgets/common/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInCredentialsColumn extends StatelessWidget {
  const SignInCredentialsColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomElevatedButton(
          onPressed: () {
            context.read<AuthBloc>().loginWithGoogle();
          },
          radius: 16,
          padding: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              FaIcon(FontAwesomeIcons.google),
              Text(AppLocalization.loginWithGoogleButtonText),
              Opacity(
                opacity: 0,
                child: FaIcon(FontAwesomeIcons.google),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        CustomElevatedButton(
          onPressed: () {
            context.read<AuthBloc>().loginWithFacebook();
          },
          radius: 16,
          padding: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              FaIcon(FontAwesomeIcons.facebook),
              Text(AppLocalization.loginWithFacebookButtonText),
              Opacity(
                opacity: 0,
                child: FaIcon(FontAwesomeIcons.facebook),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
