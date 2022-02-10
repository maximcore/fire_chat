import 'package:fire_chat/domain/entities/post_entity/post_entity.dart';
import 'package:fire_chat/domain/entities/user_entity/user_entity.dart';

abstract class PostsEvent {}

class FetchingDataEvent extends PostsEvent {}

class ErrorEvent extends PostsEvent {}

class AddPostEvent extends PostsEvent {
  AddPostEvent({
    required this.post,
    required this.user,
  });

  final PostEntity post;
  final UserEntity user;
}

class LikePostEvent extends PostsEvent {
  LikePostEvent({
    required this.postId,
    required this.userId,
  });

  final String postId;
  final String userId;
}
