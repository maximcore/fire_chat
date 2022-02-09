import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:fire_chat/domain/entities/post_entity/post_entity.dart';
import 'package:fire_chat/domain/entities/user_entity/user_entity.dart';
import 'package:fire_chat/domain/repositories/posts_repository/posts_repository.dart';
import 'package:fire_chat/presentation/blocs/posts_bloc/posts_bloc_state.dart';
import 'package:fire_chat/presentation/blocs/posts_bloc/posts_events.dart';

class PostsBloc extends Bloc<PostsEvent, PostsBlocState> {
  PostsBloc({required this.repository})
      : super(
          PostsBlocState(status: PostsBlocStatus.initial),
        ) {
    on<FetchingDataEvent>(handleFetchDataEvent);
    on<ErrorEvent>((event, emit) {
      emit(
        PostsBlocState(status: PostsBlocStatus.error),
      );
    });
    on<AddPostEvent>((event, emit) async {
      try {
        emit(
          state.copyWith(
            status: PostsBlocStatus.loading,
          ),
        );
        await repository.addPost(
          post: event.post,
        );
        final newPosts = await repository.fetchPosts();
        emit(
          state.copyWith(
            status: PostsBlocStatus.loading,
          ),
        );
        emit(
          state.copyWith(
            posts: newPosts,
            status: PostsBlocStatus.ready,
          ),
        );
      } catch (error) {
        log(error.toString());
      }
    });
  }

  FutureOr<void> handleFetchDataEvent(
    FetchingDataEvent event,
    Emitter<PostsBlocState> emit,
  ) async {
    emit(
      PostsBlocState(
        status: PostsBlocStatus.loading,
      ),
    );
    try {
      final posts = await processPosts();
      emit(
        PostsBlocState(
          status: PostsBlocStatus.ready,
          posts: posts,
        ),
      );
    } catch (error) {
      emit(
        PostsBlocState(status: PostsBlocStatus.error),
      );
    }
  }

  final PostsRepository repository;

  Future<List<PostEntity>?> processPosts() async {
    try {
      return await repository.fetchPosts();
    } catch (error) {
      log(error.toString());
      rethrow;
    }
  }

  void addPost({
    required PostEntity post,
    required UserEntity user,
  }) =>
      add(AddPostEvent(post: post, user: user));
}
