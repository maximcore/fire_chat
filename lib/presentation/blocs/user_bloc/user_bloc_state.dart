import 'package:fire_chat/domain/entities/user_entity/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'user_bloc_state.freezed.dart';

enum UserBlocStatus { logged, logouted }

@freezed
class UserBlocState with _$UserBlocState  {
  factory UserBlocState({
    UserEntity? user,
    required UserBlocStatus status,
  }) = _UserBlocState;
}
