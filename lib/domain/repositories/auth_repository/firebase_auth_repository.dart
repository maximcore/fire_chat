import 'package:fire_chat/domain/entities/user_entity/user_entity.dart';
import 'package:fire_chat/domain/repositories/auth_repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthRepository implements AuthRepository {
  FirebaseAuthRepository._();

  static final FirebaseAuthRepository _instance = FirebaseAuthRepository._();

  static FirebaseAuthRepository get instance => _instance;

  UserEntity? _userFromFirebase(UserCredential? userCredential) {
    return userCredential == null
        ? null
        : UserEntity(
            id: userCredential.user!.uid,
            username: userCredential.user!.email ?? '',
            email: userCredential.user!.email ?? '',
            profilePictureUrl: 'https://tinypng.com/images/apng/panda-waving.png',
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
    final user =
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    return _userFromFirebase(user);
  }

  @override
  Future<UserEntity?> signInWithGoogle() async {
    final googleUser = await GoogleSignIn(
      scopes: ['email', 'https://www.googleapis.com/auth/contacts.readonly'],
      hostedDomain: '',
      clientId: '',
    ).signIn();
    final googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    final user = await FirebaseAuth.instance.signInWithCredential(credential);
    return _userFromFirebase(user);
  }

  @override
  Future<UserEntity?> signInWithFacebook() async {
    final loginResult = await FacebookAuth.instance.login();
    final facebookAuthCredential = FacebookAuthProvider.credential(
      loginResult.accessToken!.token,
    );
    final user = await FirebaseAuth.instance.signInWithCredential(
      facebookAuthCredential,
    );
    return _userFromFirebase(user);
  }

  @override
  UserEntity? currentUser() {
    final currentUser = FirebaseAuth.instance.currentUser!;
    // TODO(Maxim): handle anonymous user case(remove '')
    return currentUser.isAnonymous
        ? UserEntity(
            email: currentUser.email ?? '',
            id: currentUser.uid,
            username: currentUser.email ?? '',
          )
        : UserEntity(
            email: currentUser.email!,
            id: currentUser.uid,
            username: currentUser.email!,
          );
  }
}
