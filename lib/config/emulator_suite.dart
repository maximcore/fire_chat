import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

const bool useEmulator = true;

Future connectToFirebaseEmulator() async {
  final localHost = Platform.isAndroid ? '10.0.2.2' : 'localhost';

  await FirebaseAuth.instance.useAuthEmulator(
    localHost,
    9099,
  );

  await FirebaseStorage.instance.useStorageEmulator(localHost, 9199);
}
