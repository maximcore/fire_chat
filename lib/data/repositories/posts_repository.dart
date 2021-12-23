
import 'package:fire_chat/widgets/entities/post_entity/post_entity.dart';

class PostsRepository {
  PostsRepository._();

  static final PostsRepository _instance = PostsRepository._();

  static PostsRepository get instance => _instance;

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
