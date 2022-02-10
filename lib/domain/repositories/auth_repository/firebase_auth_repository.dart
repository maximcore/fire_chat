import 'package:fire_chat/domain/entities/user_entity/user_entity.dart';
import 'package:fire_chat/domain/repositories/auth_repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthRepository implements AuthRepository {
  FirebaseAuthRepository._();

  static const _defaultUserAvatarUrl =
      'https://firebasestorage.googleapis.com/v0/b/fire-chat-mb.appspot.com/o/users%2Fdefault.png?alt=media&token=dd9e5977-f443-4308-81bc-cfb683903620';

  static final FirebaseAuthRepository _instance = FirebaseAuthRepository._();

  static FirebaseAuthRepository get instance => _instance;

  UserEntity? _userFromCredentials(UserCredential? userCredential) {
    return userCredential == null
        ? null
        : UserEntity(
            id: userCredential.user!.uid,
            username: userCredential.user!.displayName ??
                userCredential.user!.email ??
                '',
            email: userCredential.user!.email ?? '',
            profilePictureUrl: _defaultUserAvatarUrl,
          );
  }

  static UserEntity userFromFirebaseUser(User user) {
    return UserEntity(
      id: user.uid,
      email: user.isAnonymous ? 'guest' : user.email!,
      username: user.isAnonymous ? 'guest' : user.displayName ?? user.email!,
      profilePictureUrl: user.photoURL ?? _defaultUserAvatarUrl,
    );
  }

  @override
  Future<UserEntity?> signInAnonymously() async {
    final user = await FirebaseAuth.instance.signInAnonymously();
    return _userFromCredentials(user);
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
    return _userFromCredentials(user);
  }

  @override
  Future<UserEntity?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return _userFromCredentials(user);
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
    return _userFromCredentials(user);
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
    return _userFromCredentials(user);
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
            profilePictureUrl: _defaultUserAvatarUrl,
          )
        : UserEntity(
            email: currentUser.email!,
            id: currentUser.uid,
            username: currentUser.displayName ?? currentUser.email!,
            profilePictureUrl: _defaultUserAvatarUrl,
          );
  }

  @override
  Future<void> editEmail(String newEmail) async {
    await FirebaseAuth.instance.currentUser?.updateEmail(newEmail);
  }

  @override
  Future<void> editUsername(String newUsername) async {
    await FirebaseAuth.instance.currentUser?.updateDisplayName(newUsername);
  }

  @override
  Future<void> editPicture(String url) async {
    await FirebaseAuth.instance.currentUser?.updatePhotoURL(url);
  }

  @override
  Future<void> deleteUser() async {
    await FirebaseAuth.instance.currentUser?.delete();
  }
}
