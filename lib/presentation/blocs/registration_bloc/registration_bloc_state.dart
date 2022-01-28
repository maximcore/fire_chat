import 'package:fire_chat/domain/entities/user_entity/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'registration_bloc_state.freezed.dart';

enum RegistrationBlocStatus {
  initial,
  loading,
  error,
  ready,
}

@freezed
class RegistrationBlocState with _$RegistrationBlocState {
  factory RegistrationBlocState({
    UserEntity? user,
    required RegistrationBlocStatus status,
    String? errorMessage,
  }) = _RegistrationBlocState;
}
