import 'package:fire_chat/domain/entities/post_entity/post_entity.dart';

abstract class PostsRepository {
  Future<List<PostEntity>> fetchPosts();
}
