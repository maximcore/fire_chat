abstract class ProfileEditingBlocEvent {}

class InitialProfileEvent extends ProfileEditingBlocEvent {}

class EditUsernameEvent extends ProfileEditingBlocEvent {
  EditUsernameEvent(this.username);

  final String username;
}

class EditAvatarEvent extends ProfileEditingBlocEvent {
  EditAvatarEvent(this.url);

  final String url;
}

class SaveProfileEvent extends ProfileEditingBlocEvent {}
