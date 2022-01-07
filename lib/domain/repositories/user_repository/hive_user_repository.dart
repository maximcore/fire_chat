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
  Future<void> editUsername(String username) async {
    final box = GetIt.instance.get<Box>();
    late final UserEntity? newUser;

    final currentUser = box.get(StorageKeys.userHiveKey) as UserEntity?;
    newUser = currentUser!.copyWith(
      username: username,
    );
    await box.put(
      StorageKeys.userHiveKey,
      newUser,
    );
  }

  @override
  Future<void> editEmail(String email) async {
    final box = GetIt.instance.get<Box>();
    late final UserEntity? newUser;

    final currentUser = box.get(StorageKeys.userHiveKey) as UserEntity?;
    newUser = currentUser!.copyWith(
      email: email,
    );
    await box.put(
      StorageKeys.userHiveKey,
      newUser,
    );
  }

  @override
  Future<void> editProfilePictureUrl(String profilePictureUrl) async {
    final box = GetIt.instance.get<Box>();
    late final UserEntity? newUser;

    final currentUser = box.get(StorageKeys.userHiveKey) as UserEntity?;
    newUser = currentUser!.copyWith(
      profilePictureUrl: profilePictureUrl,
    );
    await box.put(
      StorageKeys.userHiveKey,
      newUser,
    );
  }

  @override
  Future<void> deleteUser() async {
    final box = GetIt.instance.get<Box>();
    if (box.containsKey(StorageKeys.userHiveKey)) {
      await box.delete(StorageKeys.userHiveKey);
    }
  }
}
