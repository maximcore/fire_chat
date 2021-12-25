import 'package:device_preview/device_preview.dart';
import 'package:fire_chat/injector.dart';
import 'package:fire_chat/main.dart';
import 'package:fire_chat/presentation/blocs/theme_bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupFake();
  runApp(
    DevicePreview(
      builder: (context) => BlocProvider<ThemeBloc>(
        create: (context) => ThemeBloc(),
        child: const MyApp(),
      ),
    ),
  );
}
