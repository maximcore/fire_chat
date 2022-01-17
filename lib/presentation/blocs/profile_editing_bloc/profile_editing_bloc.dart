import 'dart:developer';

import 'package:fire_chat/domain/entities/user_entity/user_entity.dart';
import 'package:fire_chat/domain/repositories/user_repository/user_repository.dart';
import 'package:fire_chat/presentation/blocs/profile_editing_bloc/profile_editing_bloc_events.dart';
import 'package:fire_chat/presentation/blocs/profile_editing_bloc/profile_editing_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileEditingBloc extends Bloc<ProfileEditingBlocEvent, ProfileEditingBlocState> {
  ProfileEditingBloc({
    required this.repository,
    UserEntity? user,
  }) : super(
          ProfileEditingBlocState(
            status: ProfileEditingBlocStatus.ready,
            user: user,
          ),
        ) {
    on<EditProfileEvent>((event, emit) {});
    on<SaveProfileEvent>((event, emit) async {
      try {
        final newUser = await repository.readUser();
        emit(
          ProfileEditingBlocState(
            status: ProfileEditingBlocStatus.updating,
            user: newUser,
          ),
        );
        await Future<void>.delayed(const Duration(microseconds: 250));
        emit(
          ProfileEditingBlocState(
            status: ProfileEditingBlocStatus.ready,
            user: newUser,
          ),
        );
      } catch (error) {
        emit(
          ProfileEditingBlocState(
            status: ProfileEditingBlocStatus.error,
          ),
        );
        log(error.toString());
      }
    });
  }

  final UserRepository repository;
  UserEntity localUser = const UserEntity();

  void edit() => add(EditProfileEvent());

  void save() => add(SaveProfileEvent());

  void saveUser() {
    repository.editUser(username: localUser.username, email: localUser.email);
    save();
  }

  Future<void> editUser({String? username, String? email}) async {
    if (username != null) {
      localUser = localUser.copyWith(username: username);
    }
    if (email != null) {
      localUser = localUser.copyWith(email: email);
    }
    edit();
  }
}
