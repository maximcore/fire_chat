import 'package:fire_chat/domain/repositories/user_repository/user_repository.dart';
import 'package:fire_chat/presentation/blocs/profile_editing_bloc/profile_editing_bloc.dart';
import 'package:fire_chat/presentation/blocs/profile_existence_bloc/profile_existence_bloc.dart';
import 'package:fire_chat/presentation/blocs/profile_existence_bloc/profile_existence_bloc_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class ProfileEditingBlocWrapper extends StatelessWidget {
  const ProfileEditingBlocWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileExistenceBloc, ProfileExistenceBlocState>(
      builder: (_, state) {
        return BlocProvider<ProfileEditingBloc>(
          create: (context) {
            final repository = GetIt.instance.get<UserRepository>();
            return ProfileEditingBloc(
              user: state.user!,
              repository: repository,
            );
          },
          child: child,
        );
      },
    );
  }
}