import 'package:fire_chat/domain/repositories/auth_repository/auth_repository.dart';
import 'package:fire_chat/presentation/blocs/user_profile_bloc/user_profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class UserProfileBlocWrapper extends StatelessWidget {
  const UserProfileBlocWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final repository = GetIt.instance.get<AuthRepository>();
    return BlocProvider<UserProfileBloc>(
      create: (context) {
        return UserProfileBloc(
          repository: repository,
        );
      },
      child: child,
    );
  }
}
