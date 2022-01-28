import 'package:fire_chat/domain/entities/user_entity/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_bloc_state.freezed.dart';

enum SignUpBlocStatus {
  initial,
  loading,
  error,
  ready,
}

@freezed
class SignUpBlocState with _$SignUpBlocState {
  factory SignUpBlocState({
    UserEntity? user,
    required SignUpBlocStatus status,
    String? errorMessage,
  }) = _SignUpBlocState;
}
