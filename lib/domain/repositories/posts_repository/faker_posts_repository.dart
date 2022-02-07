import 'package:faker/faker.dart';
import 'package:fire_chat/domain/entities/post_entity/post_entity.dart';
import 'package:fire_chat/domain/entities/user_entity/user_entity.dart';
import 'package:fire_chat/domain/repositories/posts_repository/posts_repository.dart';

class FakerPostsRepository implements PostsRepository {
  static const int _maxDescriptionLength = 100;
  static const int _postsAmount = 100;

  @override
  Future<List<PostEntity>> fetchPosts() async {
    await Future<void>.delayed(const Duration(seconds: 3));
    final list = List<PostEntity>.generate(
      _postsAmount,
      (_) => PostEntity(
        description: faker.randomGenerator
            .string(_maxDescriptionLength, min: _maxDescriptionLength),
        username: faker.internet.userName(),
      ),
    );
    return list;
  }

  @override
  Future<void> addPost({
    required PostEntity post,
    required UserEntity user,
  }) async {}
}
