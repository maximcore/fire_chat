import 'package:fire_chat/core/constants.dart';
import 'package:fire_chat/domain/entities/user_entity/user_entity.dart';
import 'package:fire_chat/domain/repositories/user_repository/user_repository.dart';
import 'package:fire_chat/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

class AuthBlocWrapper extends StatelessWidget {
  const AuthBlocWrapper({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final box = GetIt.instance.get<Box>();
    final user = box.get(StorageKeys.userHiveKey) as UserEntity?;
    final repository = GetIt.instance.get<UserRepository>();
    return BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(
        editedUser: user,
        repository: repository,
      ),
      child: child,
    );
  }
}
