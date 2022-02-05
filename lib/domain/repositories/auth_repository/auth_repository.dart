import 'package:fire_chat/domain/entities/user_entity/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity?> signInAnonymously();

  Future<UserEntity?> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> signOut();

  Future<UserEntity?> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<UserEntity?> signInWithGoogle();

  Future<UserEntity?> signInWithFacebook();

  UserEntity? currentUser();

  Future<void> editUsername(String username);

  Future<void> editEmail(String email);

  Future<void> editPicture(String url);

  Future<void> deleteUser();
}
