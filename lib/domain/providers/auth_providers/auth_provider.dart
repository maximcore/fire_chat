import 'package:fire_chat/domain/entities/user_entity/user_entity.dart';

abstract class AuthProvider {
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
}
