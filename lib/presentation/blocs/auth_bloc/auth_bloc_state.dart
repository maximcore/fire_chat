import 'package:fire_chat/domain/entities/user_entity/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_bloc_state.freezed.dart';

enum AuthBlocStatus {
  loading,
  loggedInAnonymously,
  loggedInWithEmailAndPassword,
  loggedInWithGoogle,
  loggedOut,
  error,
}

@freezed
class AuthBlocState with _$AuthBlocState {
  factory AuthBlocState({
    UserEntity? user,
    required AuthBlocStatus status,
    String? errorMessage,
  }) = _AuthBlocState;
}
