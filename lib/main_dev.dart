import 'package:fire_chat/config/flavors.dart';
import 'package:fire_chat/fire_chat_app.dart';
import 'package:fire_chat/injector.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  F.appFlavor = Flavor.DEV;
  await setup();
  runApp(
    const FireChatApp(),
  );
}
