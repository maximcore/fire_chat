import 'package:fire_chat/domain/entities/user_entity/user_entity.dart';
import 'package:fire_chat/domain/providers/auth_providers/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthProvider implements AuthProvider {
  FirebaseAuthProvider._();

  static final FirebaseAuthProvider _instance = FirebaseAuthProvider._();

  static FirebaseAuthProvider get instance => _instance;

  UserEntity? _userFromFirebase(UserCredential? userCredential) {
    return userCredential == null
        ? null
        : UserEntity(
            uid: userCredential.user!.uid,
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

  // @override
  // Future<FCUser?> signInWithEmailAndPassword({
  //   required String email,
  //   required String password,
  // }) async {
  //   final user = await FirebaseAuth.instance
  //       .signInWithEmailAndPassword(email: email, password: password);
  //   return _userFromFirebase(user);
  // }
}
