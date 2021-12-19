import 'package:bloc/bloc.dart';
import 'package:fire_chat/blocs/posts_bloc/posts_bloc_state.dart';
import 'package:fire_chat/blocs/posts_bloc/posts_events.dart';
import 'package:fire_chat/data/repositories/posts_repository.dart';
import 'package:fire_chat/widgets/models/post.dart';

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
      late final List<Post>? posts;
      try {
        posts = await processPosts();
      } catch (error) {}
      emit(PostsBlocState(status: PostsBlocStatus.ready, posts: posts ?? []));
    });
    on<ErrorEvent>((event, emit) {
      emit(
        PostsBlocState(status: PostsBlocStatus.error),
      );
    });
  }

  final PostsRepository _repository;

  Future<List<Post>?> processPosts() async {
    try {
      return await _repository.fetchPosts();
    } catch (error) {
      print(error);
    }
  }
}
