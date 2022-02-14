abstract class PostsEvent {}

class FetchingDataEvent extends PostsEvent {}

class ErrorEvent extends PostsEvent {}

class SavePostEvent extends PostsEvent {}

class LikePostEvent extends PostsEvent {
  LikePostEvent({
    required this.postId,
    required this.userId,
  });

  final String postId;
  final String userId;
}
