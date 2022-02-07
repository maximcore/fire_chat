import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_chat/domain/entities/post_entity/post_entity.dart';
import 'package:fire_chat/domain/entities/user_entity/user_entity.dart';
import 'package:fire_chat/domain/repositories/posts_repository/posts_repository.dart';

class FirestorePostsRepository implements PostsRepository {
  final _postsRef = FirebaseFirestore.instance.collection('posts');

  @override
  Future<void> addPost({
    required PostEntity post,
    required UserEntity user,
  }) async {
    await _postsRef.add(
      <String, dynamic>{
        'post': PostEntity(
          description: post.description,
          username: user.email,
        ).toJson(),
      },
    );
  }

  @override
  Future<List<PostEntity>> fetchPosts() async {
    final result = <PostEntity>[];
    final request = await _postsRef.get();
    for (final element in request.docs) {
      final postElement = element.data();
      final postJson = postElement['post'] as Map<String, dynamic>;
      result.add(PostEntity.fromJson(postJson));
    }
    return result;
  }
}
