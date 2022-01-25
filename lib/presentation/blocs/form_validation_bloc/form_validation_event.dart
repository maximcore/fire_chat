abstract class FormValidationEvent {}

class EmailChangedEvent extends FormValidationEvent {
  EmailChangedEvent(this.email);

  String email;
}

class EmailUnfocusedEvent extends FormValidationEvent {}

class PasswordChangedEvent extends FormValidationEvent {
  PasswordChangedEvent(this.password);

  String password;
}

class PasswordUnfocusedEvent extends FormValidationEvent {}

class FormSubmittedEvent extends FormValidationEvent {}
