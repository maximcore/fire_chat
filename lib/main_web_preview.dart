import 'package:device_preview/device_preview.dart';
import 'package:fire_chat/config/fire_chat_app_manager.dart';
import 'package:fire_chat/core/constants.dart';
import 'package:fire_chat/injector.dart';
import 'package:fire_chat/main.dart';
import 'package:fire_chat/presentation/blocs/theme_bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

void main() {
  setup();
  runApp(
    DevicePreview(
      builder: (context) => BlocProvider<ThemeBloc>(
        create: (context) {
          final box = GetIt.instance.get<Box>();
          final name = box.get(themeMode) as String;
          late final ThemeMode mode;
          switch (name) {
            case 'system':
              mode = ThemeMode.system;
              break;
            case 'light':
              mode = ThemeMode.light;
              break;
            case 'dark':
              mode = ThemeMode.dark;
              break;
            default:
              mode = ThemeMode.system;
          }
          return ThemeBloc(box: box, mode: mode);
        },
        child: const ThemeBlocWrapper(
          child: FireChatApp(),
        ),
      ),
    ),
  );
}
