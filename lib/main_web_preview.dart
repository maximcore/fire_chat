import 'package:device_preview/device_preview.dart';
import 'package:fire_chat/config/theme_bloc_wrapper.dart';
import 'package:fire_chat/injector.dart';
import 'package:fire_chat/main.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await setup();
  runApp(
    DevicePreview(
      builder: (_) => const ThemeBlocWrapper(
        child: DynamicThemeApp(),
      ),
    ),
  );
}
