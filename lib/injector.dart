import 'package:fire_chat/domain/repositories/faker_posts_repository.dart';
import 'package:fire_chat/domain/repositories/hardcoded_posts_repository.dart';
import 'package:fire_chat/domain/repositories/posts_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

const String isDarkThemeMode = 'isDark';

Future<void> setup() async {
  await Hive.initFlutter();

  GetIt.instance.registerSingleton<Box>(
    await Hive.openBox<bool>(isDarkThemeMode),
  );

  GetIt.instance.registerSingleton<PostsRepository>(
    //HardcodedPostsRepository(),
    FakerPostsRepository(),
  );
}

void setupFake() {
  GetIt.instance.registerSingleton<PostsRepository>(
    FakerPostsRepository(),
  );
}
