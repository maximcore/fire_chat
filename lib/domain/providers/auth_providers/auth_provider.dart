import 'package:fire_chat/domain/entities/user_entity/user_entity.dart';

abstract class AuthProvider {
    Future<UserEntity?> signInAnonymously();

    // Future<FCUser?> signInWithEmailAndPassword({
    //     required String email,
    //     required String password,
    // });

    Future<void> signOut();
}
