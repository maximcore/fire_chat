import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:fire_chat/blocs/posts_bloc/posts_bloc_state.dart';
import 'package:fire_chat/blocs/posts_bloc/posts_events.dart';
import 'package:fire_chat/data/repositories/posts_repository.dart';
import 'package:fire_chat/widgets/models/post_view.dart';
import 'package:fire_chat/widgets/post_widget.dart';

class PostsBloc extends Bloc<PostsEvent, PostsBlocState> {
  PostsBloc(this._repository)
      : super(
          PostsBlocState(status: PostsBlocStatus.initial),
        ) {
    on<FetchingDataEvent>((event, emit) async {
      emit(
        PostsBlocState(
          status: PostsBlocStatus.loading,
        ),
      );
      try {
        final list = await processPosts();
        final posts = list?.map((e) => PostWidget(post: e)).toList();
        emit(PostsBlocState(status: PostsBlocStatus.ready, posts: posts));
      } catch (error) {
        log(error.toString());
        emit(
          PostsBlocState(status: PostsBlocStatus.error),
        );
      }
    });
    on<ErrorEvent>((event, emit) {
      emit(
        PostsBlocState(status: PostsBlocStatus.error),
      );
    });
  }

  final PostsRepository _repository;

  Future<List<PostView>?> processPosts() async {
    try {
      return await _repository.fetchPosts();
    } catch (error) {
      log(error.toString());
    }
  }
}
