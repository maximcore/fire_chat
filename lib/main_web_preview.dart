import 'package:device_preview/device_preview.dart';
import 'package:fire_chat/config/fire_chat_app_manager.dart';
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
        create: (context) => ThemeBloc(
          box: GetIt.instance.get<Box<bool>>(),
        ),
        child: const FireChatAppManager(
          child: FireChatApp(),
        ),
      ),
    ),
  );
}
