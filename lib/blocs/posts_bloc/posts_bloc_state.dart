import 'package:fire_chat/widgets/post_widget.dart';

enum PostsBlocStatus { initial, loading, ready, error }

class PostsBlocState {
  PostsBlocState({this.posts, required this.status});

  final List<PostWidget>? posts;
  final PostsBlocStatus status;
}
