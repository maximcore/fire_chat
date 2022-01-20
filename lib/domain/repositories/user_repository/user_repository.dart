import 'package:fire_chat/domain/entities/user_entity/user_entity.dart';

abstract class UserRepository {
  Future<UserEntity?> readUser();

  Future<void> editUser({String? username, String? email});

  Future<void> editProfilePictureUrl(String profilePictureUrl);

  Future<void> deleteUser();
}
