abstract class RegistrationBlocEvent {}

class RegistrationWithEmailAndPasswordEvent extends RegistrationBlocEvent {
  RegistrationWithEmailAndPasswordEvent({
    required this.email,
    required this.password,
  });

  String email;
  String password;
}
