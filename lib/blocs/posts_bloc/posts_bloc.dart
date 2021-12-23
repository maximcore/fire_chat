import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:fire_chat/blocs/posts_bloc/posts_bloc_state.dart';
import 'package:fire_chat/blocs/posts_bloc/posts_events.dart';
import 'package:fire_chat/data/repositories/posts_repository.dart';
import 'package:fire_chat/widgets/entities/post_entity/post_entity.dart';

class PostsBloc extends Bloc<PostsEvent, PostsBlocState> {
  PostsBloc(this._repository)
      : super(
          PostsBlocState(status: PostsBlocStatus.initial),
        ) {
    on<FetchingDataEvent>(handleFetchDataEvent);
    on<ErrorEvent>((event, emit) {
      emit(
        PostsBlocState(status: PostsBlocStatus.error),
      );
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

  final PostsRepository _repository;

  Future<List<PostEntity>?> processPosts() async {
    try {
      return await _repository.fetchPosts();
    } catch (error) {
      log(error.toString());
      rethrow;
    }
  }
}
