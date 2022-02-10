import 'package:file_picker/file_picker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_post_bloc_state.freezed.dart';

enum CreatePostBlocStatus { initial, progress, ready }

@freezed
class CreatePostBlocState with _$CreatePostBlocState {
  factory CreatePostBlocState({
    String? description,
    FilePickerResult? result,
    String? imageUrl,
    required CreatePostBlocStatus status,
  }) = _CreatePostBlocState;
}