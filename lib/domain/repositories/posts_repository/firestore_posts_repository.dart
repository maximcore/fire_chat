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
    final ref = await _postsRef.get();
    final id = ref.size;
    await _postsRef.add(
      <String, dynamic>{
        '$id': PostEntity(
          description: post.description,
          username: user.email,
        ).toJson(),
      },
    );
  }

  @override
  Future<void> deletePost({
    required PostEntity post,
    required UserEntity user,
  }) async {
    //TODO(Maxim): implement this
  }

  @override
  Future<List<PostEntity>> fetchPosts() async {
    final result = <PostEntity>[];
    final request = await _postsRef.get();
    for (var id = 0; id < request.docs.length; id++) {
      final postElement = request.docs[id].data();
      final postJson = postElement['$id'] as Map<String, dynamic>?;
      if (postJson != null) {
        result.add(PostEntity.fromJson(postJson));
      }
    }
    return result;
  }
}
