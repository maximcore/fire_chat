import 'package:fire_chat/widgets/models/post.dart';

enum PostsBlocStatus { initial, loading, ready, error }

class PostsBlocState {
  PostsBlocState({this.posts, required this.status});

  final List<Post>? posts;
  final PostsBlocStatus status;
}
