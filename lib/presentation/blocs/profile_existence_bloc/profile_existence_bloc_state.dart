import 'package:fire_chat/domain/entities/user_entity/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_existence_bloc_state.freezed.dart';

enum ProfileExistenceBlocStatus { exists, notExists }

@freezed
class ProfileExistenceBlocState with _$ProfileExistenceBlocState {
  const factory ProfileExistenceBlocState({
    required ProfileExistenceBlocStatus status,
    UserEntity? user,
  }) = _ProfileExistenceBlocState;
}
