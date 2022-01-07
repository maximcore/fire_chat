import 'package:fire_chat/domain/entities/user_entity/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_editing_bloc_state.freezed.dart';

// Status of process of profile changes synchronization with repository
enum ProfileEditingBlocStatus { initial, ready, updating, error }

@freezed
class ProfileEditingBlocState with _$ProfileEditingBlocState {
  factory ProfileEditingBlocState({
    UserEntity? user,
    required ProfileEditingBlocStatus status,
  }) = _ProfileEditingBlocState;
}
