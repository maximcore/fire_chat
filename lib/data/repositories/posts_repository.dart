import 'package:faker/faker.dart';
import 'package:fire_chat/widgets/entities/post_entity/post_entity.dart';

abstract class PostsRepository {
  Future<List<PostEntity>> fetchPosts();
}

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

class HardcodedPostsRepository implements PostsRepository {
  @override
  Future<List<PostEntity>> fetchPosts() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return posts;
  }

  final List<PostEntity> posts = const [
    PostEntity(
      username: 'Maxim',
      description:
          'iusmod tempor incididunt ut labore et dolore magna aliqua. Ut ',
    ),
    PostEntity(
      username: 'Yura',
      description: 'Hello my name is Yura',
    ),
    PostEntity(
      username: 'Artem',
      description: 'Hello my name is Artem',
    ),
    PostEntity(
      username: 'Boris',
      description: 'Hello my name is Boris',
    ),
    PostEntity(
      username: 'Artem',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ',
    ),
    PostEntity(
      username: 'Artem',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ',
    ),
    PostEntity(
      username: 'Boris',
      description:
          'iusmod tempor incididunt ut labore et dolore magna aliqua. Ut ',
    ),
    PostEntity(
      username: 'Boris',
      description:
          'iusmod tempor incididunt ut labore et dolore magna aliqua. Ut ',
    ),
    PostEntity(
      username: 'Maxim',
      description: 'Hello my name is Maxim',
    ),
    PostEntity(
      username: 'Maxim',
      description:
          'iusmod tempor incididunt ut labore et dolore magna aliqua. Ut ',
    ),
    PostEntity(
      username: 'Yura',
      description:
          'iusmod tempor incididunt ut labore et dolore magna aliqua. Ut ',
    ),
  ];
}
