import 'dart:developer';

import 'package:fire_chat/core/constants.dart';
import 'package:fire_chat/domain/entities/user_entity/user_entity.dart';
import 'package:fire_chat/domain/repositories/user_repository/providers/istorage_provider.dart';
import 'package:fire_chat/domain/repositories/user_repository/user_repository.dart';
import 'package:fire_chat/presentation/blocs/profile_existence_bloc/profile_existence_bloc_events.dart';
import 'package:fire_chat/presentation/blocs/profile_existence_bloc/profile_existence_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileExistenceBloc
    extends Bloc<ProfileExistenceBlocEvent, ProfileExistenceBlocState> {
  ProfileExistenceBloc({
    required this.repository,
    required this.iStorage,
  }) : super(
          const ProfileExistenceBlocState(
            status: ProfileExistenceBlocStatus.exists,
          ),
        ) {
    on<CreateProfileEvent>((event, emit) {
      final user = fetchUser();
      iStorage.put(StorageKeys.userHiveKey, user);
      emit(
        ProfileExistenceBlocState(
          status: ProfileExistenceBlocStatus.exists,
          user: user,
        ),
      );
    });
    on<DeleteProfileEvent>((event, emit) async {
      try {
        await repository.deleteUser();
        emit(
          const ProfileExistenceBlocState(
            status: ProfileExistenceBlocStatus.notExists,
          ),
        );
      } catch (error) {
        log(error.toString());
      }
    });
  }

  final UserRepository repository;
  final IStorageProvider iStorage;

  void create() => add(CreateProfileEvent());

  void delete() => add(DeleteProfileEvent());

  UserEntity fetchUser() {
    return iStorage.containsKey(StorageKeys.userHiveKey)
        ? iStorage.get(StorageKeys.userHiveKey) as UserEntity
        : const UserEntity(
            username: 'user',
            email: 'user@gmail.com',
            id: '0',
            profilePictureUrl:
                'https://ichef.bbci.co.uk/news/640/cpsprodpb/14F0E/production/_119647758_84555a20-7d7f-4d16-906a-46bf24d4698f.jpg',
          );
  }
}
