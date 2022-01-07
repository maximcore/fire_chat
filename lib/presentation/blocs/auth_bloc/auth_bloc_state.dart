import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_bloc_state.freezed.dart';

enum AuthBlocStatus { loggedIn, loggedOut }

@freezed
class AuthBlocState with _$AuthBlocState {
  factory AuthBlocState({
    required AuthBlocStatus status,
  }) = _AuthBlocState;
}
