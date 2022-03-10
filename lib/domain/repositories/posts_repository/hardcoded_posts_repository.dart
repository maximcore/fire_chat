import 'package:fire_chat/domain/entities/comment_entity/comment_entity.dart';
import 'package:fire_chat/domain/entities/post_entity/post_entity.dart';
import 'package:fire_chat/domain/entities/user_entity/user_entity.dart';
import 'package:fire_chat/domain/repositories/posts_repository/posts_repository.dart';

class HardcodedPostsRepository implements PostsRepository {
  @override
  Future<List<PostEntity>> fetchPosts() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return posts;
  }

  final List<PostEntity> posts = const [
    // PostEntity(
    //   username: 'Maxim',
    //   description:
    //       'iusmod tempor incididunt ut labore et dolore magna aliqua. Ut ',
    // ),
    // PostEntity(
    //   username: 'Yura',
    //   description: 'Hello my name is Yura',
    // ),
    // PostEntity(
    //   username: 'Artem',
    //   description: 'Hello my name is Artem',
    // ),
    // PostEntity(
    //   username: 'Boris',
    //   description: 'Hello my name is Boris',
    // ),
    // PostEntity(
    //   username: 'Artem',
    //   description:
    //       'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ',
    // ),
    // PostEntity(
    //   username: 'Artem',
    //   description:
    //       'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ',
    // ),
    // PostEntity(
    //   username: 'Boris',
    //   description:
    //       'iusmod tempor incididunt ut labore et dolore magna aliqua. Ut ',
    // ),
    // PostEntity(
    //   username: 'Boris',
    //   description:
    //       'iusmod tempor incididunt ut labore et dolore magna aliqua. Ut ',
    // ),
    // PostEntity(
    //   username: 'Maxim',
    //   description: 'Hello my name is Maxim',
    // ),
    // PostEntity(
    //   username: 'Maxim',
    //   description:
    //       'iusmod tempor incididunt ut labore et dolore magna aliqua. Ut ',
    // ),
    // PostEntity(
    //   username: 'Yura',
    //   description:
    //       'iusmod tempor incididunt ut labore et dolore magna aliqua. Ut ',
    // ),
  ];

  @override
  Future<void> addPost({
    required PostEntity post,
  }) async {
    // TODO: implement addPost
    throw UnimplementedError();
  }

  @override
  Future<void> deletePost({
    required PostEntity post,
    required UserEntity user,
  }) {
    // TODO: implement deletePost
    throw UnimplementedError();
  }

  @override
  Future<void> likePost({
    required String postId,
    required String userId,
  }) {
    // TODO: implement likePost
    throw UnimplementedError();
  }

  @override
  Future<List<PostEntity>> fetchFollowingUsersPosts({
    required String userId,
  }) {
    // TODO: implement fetchFollowingUsersPosts
    throw UnimplementedError();
  }

  @override
  Future<void> commentPost({
    required String postId,
    required CommentEntity comment,
  }) {
    // TODO: implement commentPost
    throw UnimplementedError();
  }
}
