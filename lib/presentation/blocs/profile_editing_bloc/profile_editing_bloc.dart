import 'dart:developer';

import 'package:fire_chat/domain/entities/user_entity/user_entity.dart';
import 'package:fire_chat/domain/repositories/auth_repository/firebase_auth_repository.dart';
import 'package:fire_chat/presentation/blocs/profile_editing_bloc/profile_editing_bloc_events.dart';
import 'package:fire_chat/presentation/blocs/profile_editing_bloc/profile_editing_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileEditingBloc extends Bloc<ProfileEditingBlocEvent, ProfileEditingBlocState> {
  ProfileEditingBloc({
    required this.repository,
    required UserEntity user,
  }) : super(
          ProfileEditingBlocState(
            status: ProfileEditingBlocStatus.initial,
            user: user,
            localUser: user.copyWith(id: 'localUser'),
          ),
        ) {
    on<InitialProfileEvent>((event, emit) {
      try {
        emit(
          state.copyWith(status: ProfileEditingBlocStatus.ready),
        );
      } catch (error) {
        emit(
          state.copyWith(status: ProfileEditingBlocStatus.error),
        );
      }
    });
    on<EditUsernameEvent>((event, emit) {
      try {
        emit(
          state.copyWith(
            localUser: state.localUser.copyWith(username: event.username),
          ),
        );
      } catch (error) {
        emit(
          ProfileEditingBlocState(
            status: ProfileEditingBlocStatus.error,
            user: state.user,
            localUser: state.localUser,
          ),
        );
        log(error.toString());
      }
    });
    on<EditEmailEvent>((event, emit) {
      try {
        emit(
          state.copyWith(
            localUser: state.localUser.copyWith(email: event.email),
          ),
        );
      } catch (error) {
        emit(
          ProfileEditingBlocState(
            status: ProfileEditingBlocStatus.error,
            user: state.user,
            localUser: state.localUser,
          ),
        );
        log(error.toString());
      }
    });
    on<SaveProfileEvent>((event, emit) async {
      try {
        await Future<void>.delayed(const Duration(microseconds: 250));

        // await repository.editUser(
        //   username: state.localUser.username,
        //   email: state.localUser.email,
        // );

        await repository.editEmail(state.localUser.email);
        //await repository.editUsername(state.localUser.username);

        //final newUser = await repository.readUser();
        final newUser = repository.currentUser();

        newUser == null
            ? emit(
                ProfileEditingBlocState(
                  status: ProfileEditingBlocStatus.ready,
                  user: state.user,
                  localUser: state.user,
                ),
              )
            : emit(
                ProfileEditingBlocState(
                  status: ProfileEditingBlocStatus.ready,
                  user: newUser,
                  localUser: newUser,
                ),
              );
      } catch (error) {
        emit(
          state.copyWith(
            status: ProfileEditingBlocStatus.error,
          ),
        );
        log(error.toString());
      }
    });
  }

  final FirebaseAuthRepository repository;

  void init() => add(InitialProfileEvent());

  void save() => add(SaveProfileEvent());

  void editUsername(String username) => add(EditUsernameEvent(username));

  void editEmail(String email) => add(EditEmailEvent(email));
}
