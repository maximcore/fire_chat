import 'package:fire_chat/domain/entities/comment_entity/comment_entity.dart';
import 'package:fire_chat/domain/entities/user_entity/user_entity.dart';

abstract class PostsEvent {}

class FetchingDataEvent extends PostsEvent {}

class FetchingFollowingUsersDataEvent extends PostsEvent {
  FetchingFollowingUsersDataEvent(this.id);

  final String id;
}

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

class CommentPostEvent extends PostsEvent {
  CommentPostEvent({
    required this.postId,
    required this.comment,
  });

  final String postId;
  final CommentEntity comment;
}
