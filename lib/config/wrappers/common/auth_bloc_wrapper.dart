import 'package:fire_chat/domain/repositories/auth_repository/auth_repository.dart';
import 'package:fire_chat/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class AuthBlocWrapper extends StatelessWidget {
  const AuthBlocWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final repository = GetIt.instance.get<AuthRepository>();
    return BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(
        authRepository: repository,
      ),
      child: child,
    );
  }
}
