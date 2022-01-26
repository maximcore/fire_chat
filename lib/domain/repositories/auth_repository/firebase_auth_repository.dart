import 'package:fire_chat/domain/entities/user_entity/user_entity.dart';
import 'package:fire_chat/domain/repositories/auth_repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthRepository implements AuthRepository {
  FirebaseAuthRepository._();

  static final FirebaseAuthRepository _instance = FirebaseAuthRepository._();

  static FirebaseAuthRepository get instance => _instance;

  UserEntity? _userFromFirebase(UserCredential? userCredential) {
    return userCredential == null
        ? null
        : UserEntity(
            id: userCredential.user!.uid,
            username: userCredential.user!.email!,
            email: userCredential.user!.email!,
            profilePictureUrl:
                'https://tinypng.com/images/apng/panda-waving.png',
          );
  }

  @override
  Future<UserEntity?> signInAnonymously() async {
    final user = await FirebaseAuth.instance.signInAnonymously();
    return _userFromFirebase(user);
  }

  @override
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<UserEntity?> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return _userFromFirebase(user);
  }

@override
Future<UserEntity?> signInWithEmailAndPassword({
  required String email,
  required String password,
}) async {
  final user = await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: email, password: password);
  return _userFromFirebase(user);
}
}
