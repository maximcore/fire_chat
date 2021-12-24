import 'package:faker/faker.dart';
import 'package:fire_chat/domain/entities/post_entity/post_entity.dart';
import 'package:fire_chat/domain/repositories/posts_repository.dart';

class FakerPostsRepository implements PostsRepository {
  final int maxDescriptionLength = 100;

  @override
  Future<List<PostEntity>> fetchPosts() async {
    await Future<void>.delayed(const Duration(seconds: 3));
    final list = <PostEntity>[];
    for (var i = 0; i < maxDescriptionLength; i++) {
      list.add(
        PostEntity(
          description: faker.randomGenerator.string(
            maxDescriptionLength,
            min: maxDescriptionLength,
          ),
          username: faker.internet.userName(),
        ),
      );
    }
    return list;
  }
}