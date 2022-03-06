import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:fire_chat/domain/entities/post_entity/post_entity.dart';
import 'package:fire_chat/domain/entities/user_entity/user_entity.dart';
import 'package:fire_chat/domain/repositories/posts_repository/posts_repository.dart';

class FirestorePostsRepository implements PostsRepository {
  final _postsRef = FirebaseFirestore.instance.collection('posts');

  @override
  Future<void> addPost({
    required PostEntity post,
  }) async {
    // TODO(Maxim): change insert post logic when implement delete post function
    final ref = await _postsRef.get();
    final list = ref.docs;
    final index = list.length;
    await _postsRef.add(
      <String, dynamic>{
        'description': post.description,
        'user': post.user.toJson(),
        'postLikedByUsers': post.postLikedByUsers,
        'postId': index.toString(),
        'imageUrl': post.imageUrl,
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
      final postJson = postElement; //as Map<String, dynamic>?;
      result.add(PostEntity.fromJson(postJson));
    }
    return result;
  }

  @override
  Future<void> likePost({
    required String postId,
    required String userId,
  }) async {
    final callable = FirebaseFunctions.instanceFor(
      region: 'europe-west3',
    ).httpsCallable('likePost');
    await callable.call<Map>(<String, dynamic>{
      'user': userId,
      'postId': postId,
    });
  }

  @override
  Future<List<PostEntity>> fetchFollowingUsersPosts({
    required String userId,
  }) async {
    final result = <PostEntity>[];

    final callable = FirebaseFunctions.instanceFor(
      region: 'europe-west3',
    ).httpsCallable('fetchFollowingUsersPosts');
    final response = await callable.call<Map>(<String, dynamic>{
      'uid': userId,
    });

    final postsRaw = response.data['posts'] as List;
    for (var i = 0; i < postsRaw.length; i++) {
      final post = Map<String, dynamic>.from(postsRaw[i] as Map);
      // TODO(Maxim): figure out why it doesn't work without manual parse json
      final postLikedByUsers = List<String>.from(
        post['postLikedByUsers'] as List,
      );
      final imageUrl = post['imageUrl'] as String;
      final postId = post['postId'] as String;
      final description = post['description'] as String;
      final user = UserEntity.fromJson(
        Map<String, dynamic>.from(post['user'] as Map),
      );
      result.add(
        PostEntity(
          imageUrl: imageUrl,
          postLikedByUsers: postLikedByUsers,
          postId: postId,
          description: description,
          user: user,
        ),
      );
    }
    return result;
  }
}
