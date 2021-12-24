import 'package:fire_chat/domain/repositories/faker_posts_repository.dart';
import 'package:fire_chat/domain/repositories/hardcoded_posts_repository.dart';
import 'package:fire_chat/domain/repositories/posts_repository.dart';
import 'package:get_it/get_it.dart';

void setup() {
  GetIt.instance.registerSingleton<PostsRepository>(
    HardcodedPostsRepository(),
  );
}

void setupFake() {
  GetIt.instance.registerSingleton<PostsRepository>(
    FakerPostsRepository(),
  );
}
