import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';

const bool useEmulator = true;

Future connectToFirebaseEmulator() async {
  final localHost = Platform.isAndroid ? '10.0.2.2' : 'localhost';

  await FirebaseAuth.instance.useAuthEmulator(
    localHost,
    9099,
  );
}
