import 'package:fire_chat/domain/entities/post_entity/post_entity.dart';
import 'package:fire_chat/domain/entities/user_entity/user_entity.dart';

abstract class PostsRepository {
  Future<List<PostEntity>> fetchPosts();

  Future<void> addPost({
    required PostEntity post,
  });

  Future<void> deletePost({
    required PostEntity post,
    required UserEntity user,
  });

  Future<void> likePost({
    required String postId,
    required String userId,
  });

  Future<List<PostEntity>> fetchFollowingUsersPosts({
    required String userId,
  });
}
