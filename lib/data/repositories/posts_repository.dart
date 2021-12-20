import 'package:fire_chat/widgets/models/post_view.dart';

class PostsRepository {
  PostsRepository._();

  static final PostsRepository _instance = PostsRepository._();

  static PostsRepository get instance => _instance;

  Future<List<PostView>> fetchPosts() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return posts;
  }

  final List<PostView> posts = [
    PostView(
      username: 'Maxim',
      description:
          'iusmod tempor incididunt ut labore et dolore magna aliqua. Ut ',
    ),
    PostView(
      username: 'Yura',
      description: 'Hello my name is Yura',
    ),
    PostView(
      username: 'Artem',
      description: 'Hello my name is Artem',
    ),
    PostView(
      username: 'Boris',
      description: 'Hello my name is Boris',
    ),
    PostView(
      username: 'Artem',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ',
    ),
    PostView(
      username: 'Artem',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ',
    ),
    PostView(
      username: 'Boris',
      description:
          'iusmod tempor incididunt ut labore et dolore magna aliqua. Ut ',
    ),
    PostView(
      username: 'Boris',
      description:
          'iusmod tempor incididunt ut labore et dolore magna aliqua. Ut ',
    ),
    PostView(
      username: 'Maxim',
      description: 'Hello my name is Maxim',
    ),
    PostView(
      username: 'Maxim',
      description:
          'iusmod tempor incididunt ut labore et dolore magna aliqua. Ut ',
    ),
    PostView(
      username: 'Yura',
      description:
          'iusmod tempor incididunt ut labore et dolore magna aliqua. Ut ',
    ),
  ];
}
