import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fire_chat/domain/entities/post_entity/post_entity.dart';
import 'package:fire_chat/domain/repositories/posts_repository/posts_repository.dart';
import 'package:fire_chat/domain/repositories/storage_repository/storage_repository.dart';
import 'package:fire_chat/presentation/blocs/create_post_bloc/create_post_bloc_state.dart';
import 'package:fire_chat/presentation/blocs/create_post_bloc/create_post_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatePostBloc extends Bloc<CreatePostEvent, CreatePostBlocState> {
  CreatePostBloc({
    required this.postsRepository,
    required this.storageRepository,
  }) : super(
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
    on<UploadImageToStorage>((event, emit) async {
      try {
        emit(
          state.copyWith(
            status: CreatePostBlocStatus.progress,
          ),
        );
        final path = state.result?.files.single.path as String;
        final name = state.result?.files.single.name as String;
        final url = await storageRepository.uploadPicture(
          path: path,
          name: name,
        );
        final post = event.post.copyWith(
          imageUrl: url,
        );
        await postsRepository.addPost(
          post: post,
        );
        await postsRepository.fetchPosts();
        emit(
          state.copyWith(
            imageUrl: url,
            status: CreatePostBlocStatus.ready,
          ),
        );
      } on FirebaseException catch (error) {
        log(error.message.toString());
      } catch (error) {
        log(error.toString());
      }
    });
    on<ClearPost>((event, emit) {
      emit(
        CreatePostBlocState(
          status: CreatePostBlocStatus.initial,
        ),
      );
    });
  }

  final PostsRepository postsRepository;
  final StorageRepository storageRepository;

  void editDescription(String description) => add(
        EditDescription(
          description,
        ),
      );

  void editImage(FilePickerResult imagePath) => add(
        EditImage(
          imagePath,
        ),
      );

  void uploadImageToStorage(
    PostEntity post,
  ) =>
      add(
        UploadImageToStorage(
          post: post,
        ),
      );

  void discard() => add(
        Discard(),
      );

  void clearPost() => add(
        ClearPost(),
      );
}
