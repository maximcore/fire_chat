import 'package:fire_chat/core/constants.dart';
import 'package:fire_chat/domain/entities/user_entity/user_entity.dart';
import 'package:fire_chat/domain/repositories/auth_repository/auth_repository.dart';
import 'package:fire_chat/domain/repositories/auth_repository/firebase_auth_repository.dart';
import 'package:fire_chat/domain/repositories/posts_repository/faker_posts_repository.dart';
import 'package:fire_chat/domain/repositories/posts_repository/firestore_posts_repository.dart';
import 'package:fire_chat/domain/repositories/posts_repository/posts_repository.dart';
import 'package:fire_chat/domain/repositories/storage_repository/firebase_storage_repository.dart';
import 'package:fire_chat/domain/repositories/storage_repository/storage_repository.dart';
import 'package:fire_chat/domain/repositories/user_repository/hive_user_repository.dart';
import 'package:fire_chat/domain/repositories/user_repository/providers/hive_storage_provider.dart';
import 'package:fire_chat/domain/repositories/user_repository/providers/istorage_provider.dart';
import 'package:fire_chat/domain/repositories/user_repository/user_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> setup() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserEntityAdapter());
  GetIt.instance.registerSingleton<Box>(
    await Hive.openBox<dynamic>(StorageKeys.themeModeHiveKey),
  );

  GetIt.instance.registerSingleton<IStorageProvider>(
    HiveStorageProvider(),
  );

  GetIt.instance.registerSingleton<AuthRepository>(
    FirebaseAuthRepository.instance,
  );

  GetIt.instance.registerSingleton<UserRepository>(
    HiveUserRepository(),
  );

  GetIt.instance.registerSingleton<StorageRepository>(
    FirebaseStorageRepository(),
  );

  GetIt.instance.registerSingleton<PostsRepository>(
    //HardcodedPostsRepository(),
    //FakerPostsRepository(),
    FirestorePostsRepository(),
  );
}

void setupFake() {
  GetIt.instance.registerSingleton<PostsRepository>(
    FakerPostsRepository(),
  );
}
