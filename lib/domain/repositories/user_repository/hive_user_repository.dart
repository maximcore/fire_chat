import 'package:fire_chat/core/constants.dart';
import 'package:fire_chat/domain/entities/user_entity/user_entity.dart';
import 'package:fire_chat/domain/repositories/user_repository/user_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

class HiveUserRepository implements UserRepository {
  @override
  Future<UserEntity?> readUser() async {
    final box = GetIt.instance.get<Box>();
    final hiveUser = box.get(StorageKeys.userHiveKey) as UserEntity?;
    return hiveUser;
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
        userEntity,
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
