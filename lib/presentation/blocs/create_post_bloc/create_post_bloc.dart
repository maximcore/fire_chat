import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:fire_chat/domain/repositories/storage_repository/firebase_storage_repository.dart';
import 'package:fire_chat/presentation/blocs/create_post_bloc/create_post_bloc_state.dart';
import 'package:fire_chat/presentation/blocs/create_post_bloc/create_post_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatePostBloc extends Bloc<CreatePostEvent, CreatePostBlocState> {
  CreatePostBloc()
      : super(
          CreatePostBlocState(
            status: CreatePostBlocStatus.initial,
          ),
        ) {
    on<EditDescription>((event, emit) {
      emit(
        state.copyWith(
          description: event.description,
          status: CreatePostBlocStatus.progress,
        ),
      );
    });
    on<EditImage>((event, emit) {
      emit(
        state.copyWith(
          result: event.image,
          status: CreatePostBlocStatus.progress,
        ),
      );
    });
    on<Discard>((event, emit) {
      emit(
        CreatePostBlocState(
          status: CreatePostBlocStatus.initial,
        ),
      );
    });
    on<SavePost>((event, emit) async {
      try {
        final storage = FirebaseStorageRepository();
        final url = await storage.uploadPicture(
          path: state.result?.files.single.path as String,
          name: state.result?.files.single.name as String,
        );
        emit(state.copyWith(
          imageUrl: url,
          status: CreatePostBlocStatus.ready,
        ));
      }
      catch (error) {
        log(error.toString());
      }
    });
  }

  void editDescription(String description) => add(EditDescription(description));

  void editImage(FilePickerResult imagePath) => add(EditImage(imagePath));

  void savePost() => add(SavePost());

  void discard() => add(Discard());
}
