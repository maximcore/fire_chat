import 'package:fire_chat/config/flavors.dart';
import 'package:fire_chat/injector.dart';
import 'package:fire_chat/fire_chat_app.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  F.appFlavor = Flavor.LOCAL;
  await setup();
  runApp(
    const FireChatApp(),
  );
}
