import 'package:fire_chat/core/constants.dart';
import 'package:fire_chat/domain/entities/user_entity/user_entity.dart';
import 'package:fire_chat/domain/repositories/posts_repository/faker_posts_repository.dart';
import 'package:fire_chat/domain/repositories/posts_repository/posts_repository.dart';
import 'package:fire_chat/domain/repositories/user_repository/hive_user_repository.dart';
import 'package:fire_chat/domain/repositories/user_repository/user_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> setup() async {
  await Hive.initFlutter();
  GetIt.instance.registerSingleton<Box>(
    await Hive.openBox<String>(StorageKeys.themeModeHiveKey),
  );

  GetIt.instance.registerSingleton<UserRepository>(
    HiveUserRepository(),
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
