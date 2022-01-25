import 'package:fire_chat/domain/providers/auth_providers/firebase_auth_provider.dart';
import 'package:fire_chat/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBlocWrapper extends StatelessWidget {
  const AuthBlocWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(
        authProvider: FirebaseAuthProvider.instance,
      ),
      child: child,
    );
  }
}
