import 'package:device_preview/device_preview.dart';
import 'package:fire_chat/main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => const MyApp(),
    ),
  );
}
