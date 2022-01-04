import 'package:fire_chat/core/constants.dart';
import 'package:fire_chat/domain/entities/user_entity/user_entity.dart';
import 'package:fire_chat/domain/repositories/user_repository/user_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

class HiveUserRepository implements UserRepository {
  @override
  Future<UserEntity> readUser() async {
    final box = GetIt.instance.get<Box>();
    final userJson = box.get(StorageKeys.userHiveKey) as Map<String, dynamic>?;
    final user = UserEntity.fromJson(
      userJson ??
          <String, dynamic>{
            'username': 'defaultUser',
            'email': 'defaultUser@gmail.com',
            'id': '0',
            'profilePictureUrl':
                'https://www.meme-arsenal.com/memes/8b8f3ff61d96ebbef940afb4de5d56ac.jpg',
          },
    );
    return user;
  }

  @override
  Future<void> editUser(UserEntity userEntity) async {
    final box = GetIt.instance.get<Box>();
    if (box.containsKey(StorageKeys.userHiveKey)) {
      await box.delete(
        StorageKeys.userHiveKey,
      );
      await box.put(
        StorageKeys.userHiveKey,
        userEntity.toJson(),
      );
    }
  }

  @override
  Future<void> deleteUser() async {
    final box = GetIt.instance.get<Box>();
    if (box.containsKey(StorageKeys.userHiveKey)) {
      await box.delete(StorageKeys.userHiveKey);
    }
  }
}
