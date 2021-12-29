import 'package:fire_chat/core/constants.dart';
import 'package:fire_chat/domain/repositories/faker_posts_repository.dart';
import 'package:fire_chat/domain/repositories/posts_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> setup() async {
  await Hive.initFlutter();
  GetIt.instance.registerSingleton<Box>(
    await Hive.openBox<String>(StorageKeys.themeModeHiveKey),
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
