abstract class SignUpBlocEvent {}

class SignUpWithEmailAndPasswordEvent extends SignUpBlocEvent {
  SignUpWithEmailAndPasswordEvent({
    required this.email,
    required this.password,
  });

  String email;
  String password;
}
