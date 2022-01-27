abstract class AuthBlocEvent {}

class AnonymousLoginEvent extends AuthBlocEvent {}

class LoginWithEmailAndPasswordEvent extends AuthBlocEvent {
  LoginWithEmailAndPasswordEvent({
    required this.email,
    required this.password,
  });

  String email;
  String password;
}

class LoginWithEmailAndPasswordAfterRegistrationEvent extends AuthBlocEvent {
  LoginWithEmailAndPasswordAfterRegistrationEvent({
    required this.email,
    required this.password,
  });

  String email;
  String password;
}

class SignOutEvent extends AuthBlocEvent {}
