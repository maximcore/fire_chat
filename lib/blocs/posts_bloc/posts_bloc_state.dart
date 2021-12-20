import 'package:fire_chat/widgets/models/post_view.dart';

enum PostsBlocStatus { initial, loading, ready, error }

class PostsBlocState {
  PostsBlocState({this.posts, required this.status});

  final List<PostEntity>? posts;
  final PostsBlocStatus status;
}
