import 'package:fire_chat/data/models/form/email.dart';
import 'package:fire_chat/data/models/form/password.dart';
import 'package:fire_chat/presentation/blocs/form_validation_bloc/form_validation_event.dart';
import 'package:fire_chat/presentation/blocs/form_validation_bloc/form_validation_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class FormValidationBloc
    extends Bloc<FormValidationEvent, FormValidationState> {
  FormValidationBloc()
      : super(
          FormValidationState(
            email: const Email.pure(),
            password: const Password.pure(),
            status: FormzStatus.pure,
          ),
        ) {
    on<EmailChangedEvent>((event, emit) {
      final email = Email.dirty(event.email);
      emit(
        state.copyWith(
          email: email.valid ? email : Email.pure(event.email),
          status: Formz.validate([email, state.password]),
        ),
      );
    });
    on<EmailUnfocusedEvent>((event, emit) {
      final email = Email.dirty(state.email.value);
      emit(
        state.copyWith(
          email: email,
          status: Formz.validate([email, state.password]),
        ),
      );
    });
    on<PasswordChangedEvent>((event, emit) {
      final password = Password.dirty(event.password);
      emit(
        state.copyWith(
          password: password.valid ? password : Password.pure(event.password),
          status: Formz.validate([state.email, password]),
        ),
      );
    });
    on<PasswordUnfocusedEvent>((event, emit) {
      final password = Password.dirty(state.password.value);
      emit(
        state.copyWith(
          password: password,
          status: Formz.validate([state.email, password]),
        ),
      );
    });
    on<FormSubmittedEvent>((event, emit) async {
      final email = Email.dirty(state.email.value);
      final password = Password.dirty(state.password.value);
      emit(
        state.copyWith(
          email: email,
          password: password,
          status: Formz.validate([email, password]),
        ),
      );
      if (state.status.isValidated) {
        emit(state.copyWith(status: FormzStatus.submissionInProgress));
        await Future<void>.delayed(const Duration(seconds: 1));
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      }
    });
  }

  void changeEmail(String email) => add(EmailChangedEvent(email));

  void changePassword(String password) => add(PasswordChangedEvent(password));

  void unfocusEmail() => add(EmailUnfocusedEvent());

  void unfocusPassword() => add(PasswordUnfocusedEvent());

  void submit() => add(FormSubmittedEvent());
}
