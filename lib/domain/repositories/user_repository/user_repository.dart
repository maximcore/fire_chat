import 'package:fire_chat/domain/entities/user_entity/user_entity.dart';

abstract class UserRepository {
  Future<UserEntity?> readUser();

  Future<void> editUser(UserEntity userEntity);

  Future<void> deleteUser();
}
