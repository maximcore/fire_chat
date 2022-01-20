import 'package:fire_chat/core/constants.dart';
import 'package:fire_chat/domain/entities/user_entity/user_entity.dart';
import 'package:fire_chat/domain/repositories/user_repository/providers/istorage_provider.dart';
import 'package:fire_chat/domain/repositories/user_repository/user_repository.dart';
import 'package:get_it/get_it.dart';

class HiveUserRepository implements UserRepository {
  @override
  Future<UserEntity?> readUser() async {
    final iStorage = GetIt.instance.get<IStorageProvider>();
    final hiveUser = iStorage.get(StorageKeys.userHiveKey) as UserEntity?;
    return hiveUser;
  }

  @override
  Future<void> editUser({String? username, String? email}) async {
    final iStorage = GetIt.instance.get<IStorageProvider>();

    final currentUser = await readUser();
    final newUser = currentUser!.copyWith(
      username: username ?? currentUser.username,
      email: email ?? currentUser.email,
    );
    await iStorage.put(
      StorageKeys.userHiveKey,
      newUser,
    );
  }

  @override
  Future<void> editProfilePictureUrl(String profilePictureUrl) async {
    final iStorage = GetIt.instance.get<IStorageProvider>();
    final currentUser = iStorage.get(StorageKeys.userHiveKey) as UserEntity?;
    final newUser = currentUser!.copyWith(
      profilePictureUrl: profilePictureUrl,
    );
    await iStorage.put(
      StorageKeys.userHiveKey,
      newUser,
    );
  }

  @override
  Future<void> deleteUser() async {
    final iStorage = GetIt.instance.get<IStorageProvider>();
    await iStorage.delete(StorageKeys.userHiveKey);
  }
}
