import 'package:fire_chat/core/constants.dart';
import 'package:fire_chat/domain/entities/user_entity/user_entity.dart';
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
        final iStorage = GetIt.instance.get<IStorageProvider>();
        final user = fetchUser(iStorage);
        iStorage.put(StorageKeys.userHiveKey, user);
        final repository = GetIt.instance.get<UserRepository>();
        return ProfileExistenceBloc(
          initialUser: user,
          repository: repository,
        );
      },
      child: child,
    );
  }

  UserEntity? fetchUser(IStorageProvider iStorage) {
    return iStorage.containsKey(StorageKeys.userHiveKey)
        ? iStorage.get(StorageKeys.userHiveKey) as UserEntity?
        : const UserEntity(
            username: 'user',
            email: 'user@gmail.com',
            id: '0',
            profilePictureUrl:
                'https://ichef.bbci.co.uk/news/640/cpsprodpb/14F0E/production/_119647758_84555a20-7d7f-4d16-906a-46bf24d4698f.jpg',
          );
  }
}
