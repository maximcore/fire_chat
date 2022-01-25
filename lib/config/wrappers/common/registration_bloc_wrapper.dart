import 'package:fire_chat/domain/providers/auth_providers/firebase_auth_provider.dart';
import 'package:fire_chat/presentation/blocs/registration_bloc/registration_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationBlocWrapper extends StatelessWidget {
  const RegistrationBlocWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegistrationBloc>(
      create: (context) => RegistrationBloc(
        authProvider: FirebaseAuthProvider.instance,
      ),
      child: child,
    );
  }
}
