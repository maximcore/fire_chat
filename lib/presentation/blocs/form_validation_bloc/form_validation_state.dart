import 'package:fire_chat/data/models/form/email.dart';
import 'package:fire_chat/data/models/form/password.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_validation_state.freezed.dart';

@freezed
class FormValidationState with _$FormValidationState {
  factory FormValidationState({
    required Email email,
    required Password password,
    required FormzStatus status,
  }) = _FormValidationState;
}
