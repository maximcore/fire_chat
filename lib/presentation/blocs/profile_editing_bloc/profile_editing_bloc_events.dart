abstract class ProfileEditingBlocEvent {}

//class InitialProfileEvent extends ProfileEditingBlocEvent {}

class EditUsernameEvent extends ProfileEditingBlocEvent {
  EditUsernameEvent(this.username);

  final String username;
}

class EditEmailEvent extends ProfileEditingBlocEvent {
  EditEmailEvent(this.email);

  final String email;
}

class SaveProfileEvent extends ProfileEditingBlocEvent {}


