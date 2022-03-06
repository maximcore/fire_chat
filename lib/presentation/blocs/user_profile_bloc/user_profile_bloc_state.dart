import 'package:fire_chat/domain/entities/user_entity/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_bloc_state.freezed.dart';

enum UserProfileBlocStatus { initial, ready, updating, error }

@freezed
class UserProfileBlocState with _$UserProfileBlocState {
  factory UserProfileBlocState({
    UserEntity? user,
    required UserProfileBlocStatus status,
  }) = _UserProfileBlocState;
}
