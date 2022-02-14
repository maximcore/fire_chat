import 'package:file_picker/file_picker.dart';
import 'package:fire_chat/domain/entities/post_entity/post_entity.dart';

abstract class CreatePostEvent {}

class EditDescription extends CreatePostEvent {
  EditDescription(this.description);

  final String description;
}

class EditImage extends CreatePostEvent {
  EditImage(this.image);

  final FilePickerResult image;
}

class UploadImageToStorage extends CreatePostEvent {
  UploadImageToStorage({
    required this.post,
  });

  final PostEntity post;
}

class Discard extends CreatePostEvent {}
