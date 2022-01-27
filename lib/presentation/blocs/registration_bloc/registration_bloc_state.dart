import 'package:fire_chat/domain/entities/user_entity/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'registration_bloc_state.freezed.dart';

@freezed
class RegistrationBlocState with _$RegistrationBlocState {
  factory RegistrationBlocState({
    UserEntity? user,
  }) = _RegistrationBlocState;
}
