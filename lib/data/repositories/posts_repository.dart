import 'package:fire_chat/widgets/models/post.dart';

class PostsRepository {
  PostsRepository._();

  static final PostsRepository _instance = PostsRepository._();

  static PostsRepository get instance => _instance;

  Future<List<Post>> fetchPosts() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return posts;
  }

  final List<Post> posts = [
    Post(
      username: 'Maxim',
      description:
          'iusmod tempor incididunt ut labore et dolore magna aliqua. Ut ',
    ),
    Post(
      username: 'Yura',
      description: 'Hello my name is Yura',
    ),
    Post(
      username: 'Artem',
      description: 'Hello my name is Artem',
    ),
    Post(
      username: 'Boris',
      description: 'Hello my name is Boris',
    ),
    Post(
      username: 'Artem',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ',
    ),
    Post(
      username: 'Artem',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ',
    ),
    Post(
      username: 'Boris',
      description:
          'iusmod tempor incididunt ut labore et dolore magna aliqua. Ut ',
    ),
    Post(
      username: 'Boris',
      description:
          'iusmod tempor incididunt ut labore et dolore magna aliqua. Ut ',
    ),
    Post(
      username: 'Maxim',
      description: 'Hello my name is Maxim',
    ),
    Post(
      username: 'Maxim',
      description:
          'iusmod tempor incididunt ut labore et dolore magna aliqua. Ut ',
    ),
    Post(
      username: 'Yura',
      description:
          'iusmod tempor incididunt ut labore et dolore magna aliqua. Ut ',
    ),
  ];
}
