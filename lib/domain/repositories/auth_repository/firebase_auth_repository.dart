import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:fire_chat/domain/entities/user_entity/user_entity.dart';
import 'package:fire_chat/domain/repositories/auth_repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthRepository implements AuthRepository {
  FirebaseAuthRepository._();

  final _usersRef = FirebaseFirestore.instance.collection('users');
  final _followersRef = FirebaseFirestore.instance.collection('followers');
  final _followingRef = FirebaseFirestore.instance.collection('following');

  static const _defaultUserAvatarUrl =
      'https://firebasestorage.googleapis.com/v0/b/fire-chat-mb.appspot.com/o/users%2Fdefault.png?alt=media&token=dd9e5977-f443-4308-81bc-cfb683903620';

  static final FirebaseAuthRepository _instance = FirebaseAuthRepository._();

  static FirebaseAuthRepository get instance => _instance;

  Future<UserEntity?> _userFromCredentials(
    UserCredential? userCredential,
  ) async {
    late final UserEntity? user;
    if (userCredential != null) {
      user = await fetchUserById(uid: userCredential.user!.uid);
    }
    return userCredential == null
        ? null
        : UserEntity(
            id: userCredential.user!.uid,
            username: userCredential.user!.displayName ?? userCredential.user!.email ?? '',
            email: userCredential.user!.email ?? '',
            profilePictureUrl: _defaultUserAvatarUrl,
            followers: user!.followers,
            following: user.following,
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

    //TODO(Maxim): finish this
    await setupFollowers(user.user!.uid);
    return _userFromCredentials(user);
  }

  @override
  Future<UserEntity?> signInWithGoogle() async {
    final googleUser = await GoogleSignIn(
      scopes: ['email', 'https://www.googleapis.com/auth/contacts.readonly'],
      hostedDomain: '',
    ).signIn();
    final googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    final user = await FirebaseAuth.instance.signInWithCredential(credential);
    //TODO(Maxim): finish this
    await setupFollowers(user.user!.uid);

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

    //TODO(Maxim): finish this
    await setupFollowers(user.user!.uid);

    return _userFromCredentials(user);
  }

  @override
  UserEntity? currentUser() {
    final currentUser = FirebaseAuth.instance.currentUser!;
    // TODO(Maxim): handle anonymous user case(remove '') + handle followers
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

  Future<void> setupFollowers(String uid) async {
    final request = await _usersRef.get();
    final users = <String>[];

    for (var i = 0; i < request.docs.length; i++) {
      final userJson = request.docs[i].data();
      final userIterable = userJson.values;
      late final String id;
      for (final element in userIterable) {
        id = element as String;
      }
      users.add(id);
    }

    final userId = request.docs.length;

    if (!users.contains(uid)) {
      await _usersRef.add(
        <String, dynamic>{
          '$userId': uid,
        },
      );
      await _followersRef.add(
        <String, dynamic>{
          uid: <String>[],
        },
      );
      await _followingRef.add(
        <String, dynamic>{
          uid: <String>[],
        },
      );
    }
  }

  @override
  Future<UserEntity?> fetchUserById({required String uid}) async {
    final callable = FirebaseFunctions.instanceFor(
      region: 'europe-west3',
    ).httpsCallable('fetchUserById');
    final response = await callable.call<Map>(<String, dynamic>{'uid': uid});
    final data = response.data;
    final userData = Map<String, dynamic>.from(data['user'] as Map);
    return UserEntity.fromJson(userData);
  }

  @override
  Future<void> followUser({
    required String uid,
    required String followerId,
  }) async {
    final callable = FirebaseFunctions.instanceFor(
      region: 'europe-west3',
    ).httpsCallable('followUser');
    //final response =
    await callable.call<Map>(<String, dynamic>{
      'uid': uid,
      'followingId': followerId,
    });
  }
}
