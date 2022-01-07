import 'dart:developer';

import 'package:fire_chat/domain/entities/user_entity/user_entity.dart';
import 'package:fire_chat/domain/repositories/user_repository/user_repository.dart';
import 'package:fire_chat/presentation/blocs/profile_editing_bloc/profile_editing_bloc_events.dart';
import 'package:fire_chat/presentation/blocs/profile_editing_bloc/profile_editing_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileEditingBloc extends Bloc<ProfileEditingBlocEvent, ProfileEditingBlocState> {
  ProfileEditingBloc({
    required this.repository,
    UserEntity? initialUser,
  }) : super(
          ProfileEditingBlocState(
            status: ProfileEditingBlocStatus.ready,
            user: initialUser,
          ),
        ) {
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

  void edit() => add(EditProfileEvent());

  void save() => add(SaveProfileEvent());

  void updateUserWithUsername(String username) {
    repository.editUsername(username);
    save();
  }

  void updateUserWithEmail(String email) {
    repository.editEmail(email);
    save();
  }
}
