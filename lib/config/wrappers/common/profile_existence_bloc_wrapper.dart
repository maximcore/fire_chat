import 'package:fire_chat/domain/repositories/user_repository/providers/istorage_provider.dart';
import 'package:fire_chat/domain/repositories/user_repository/user_repository.dart';
import 'package:fire_chat/presentation/blocs/profile_existence_bloc/profile_existence_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class ProfileExistenceBlocWrapper extends StatelessWidget {
  const ProfileExistenceBlocWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileExistenceBloc>(
      create: (context) {
        return ProfileExistenceBloc(
          repository: GetIt.instance.get<UserRepository>(),
          iStorage: GetIt.instance.get<IStorageProvider>(),
        )..create();
      },
      child: child,
    );
  }
}
