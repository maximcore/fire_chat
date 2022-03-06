import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:fire_chat/domain/entities/post_entity/post_entity.dart';
import 'package:fire_chat/domain/repositories/posts_repository/posts_repository.dart';
import 'package:fire_chat/presentation/blocs/posts_bloc/posts_bloc_state.dart';
import 'package:fire_chat/presentation/blocs/posts_bloc/posts_events.dart';

class PostsBloc extends Bloc<PostsEvent, PostsBlocState> {
  PostsBloc({required this.repository})
      : super(
          PostsBlocState(status: PostsBlocStatus.initial),
        ) {
    on<FetchingDataEvent>(handleFetchDataEvent);
    on<FetchingFollowingUsersDataEvent>((event, emit) async {
      try {
        emit(
          state.copyWith(status: PostsBlocStatus.loading),
        );
        final posts = await repository.fetchFollowingUsersPosts(
          userId: event.id,
        );
        emit(
          state.copyWith(
            status: PostsBlocStatus.ready,
            posts: posts,
          ),
        );
      } catch (error) {
        log(error.toString());
        emit(
          state.copyWith(status: PostsBlocStatus.error),
        );
      }
    });
    on<ErrorEvent>((event, emit) {
      emit(
        PostsBlocState(status: PostsBlocStatus.error),
      );
    });
    on<SavePostEvent>((event, emit) async {
      try {
        emit(
          state.copyWith(
            status: PostsBlocStatus.loading,
          ),
        );
        final newPosts = await repository.fetchPosts();
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

    on<LikePostEvent>((event, emit) async {
      try {
        await repository.likePost(
          postId: event.postId,
          userId: event.userId,
        );
        final posts = await repository.fetchPosts();
        emit(
          state.copyWith(
            posts: posts,
            status: PostsBlocStatus.ready,
          ),
        );
      } catch (error) {
        emit(
          state.copyWith(
            status: PostsBlocStatus.error,
          ),
        );
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

  void savePost() => add(SavePostEvent());

  void likePost({
    required String postId,
    required String userId,
  }) =>
      add(
        LikePostEvent(postId: postId, userId: userId),
      );

  void fetchPosts() => add(FetchingDataEvent());

  void fetchFollowingUsersPosts(String id) => add(
        FetchingFollowingUsersDataEvent(
          id,
        ),
      );
}
