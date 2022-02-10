import 'package:file_picker/file_picker.dart';

abstract class CreatePostEvent {}

class EditDescription extends CreatePostEvent {
  EditDescription(this.description);

  final String description;
}

class EditImage extends CreatePostEvent {
  EditImage(this.image);

  final FilePickerResult image;
}

class SavePost extends CreatePostEvent {}

class Discard extends CreatePostEvent {}
