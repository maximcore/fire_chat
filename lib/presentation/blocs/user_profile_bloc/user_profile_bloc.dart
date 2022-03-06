import 'dart:developer';

import 'package:fire_chat/domain/repositories/auth_repository/auth_repository.dart';
import 'package:fire_chat/presentation/blocs/user_profile_bloc/user_profile_bloc_evens.dart';
import 'package:fire_chat/presentation/blocs/user_profile_bloc/user_profile_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileBlocState> {
  UserProfileBloc({
    required this.repository,
  }) : super(
          UserProfileBlocState(
            status: UserProfileBlocStatus.initial,
          ),
        ) {
    on<InitialEvent>((event, emit) async {
      try {
        emit(
          state.copyWith(
            status: UserProfileBlocStatus.updating,
          ),
        );
        final user = await repository.fetchUserById(uid: event.uid);
        emit(
          state.copyWith(
            user: user,
            status: UserProfileBlocStatus.ready,
          ),
        );
      } catch (e) {
        log(e.toString());
        emit(
          state.copyWith(
            status: UserProfileBlocStatus.error,
          ),
        );
      }
    });
    on<FollowEvent>((event, emit) async {
      try {
        emit(
          state.copyWith(
            status: UserProfileBlocStatus.updating,
          ),
        );
        await repository.followUser(
          uid: event.uid,
          followerId: event.followerId,
        );
        final user = await repository.fetchUserById(
          uid: event.uid,
        );
        emit(
          state.copyWith(
            user: user,
            status: UserProfileBlocStatus.ready,
          ),
        );
      } catch (e) {
        log(e.toString());
        emit(
          state.copyWith(
            status: UserProfileBlocStatus.error,
          ),
        );
      }
    });
    on<UnfollowEvent>((event, emit) {});
  }

  final AuthRepository repository;

  void initProfile(String uid) => add(InitialEvent(uid));

  void followUser({
    required String uid,
    required String followerId,
  }) =>
      add(
        FollowEvent(
          uid: uid,
          followerId: followerId,
        ),
      );
}
