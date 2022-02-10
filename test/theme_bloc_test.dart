import 'package:bloc_test/bloc_test.dart';
import 'package:fire_chat/injector.dart';
import 'package:fire_chat/presentation/blocs/theme_bloc/theme_bloc.dart';
import 'package:fire_chat/presentation/blocs/theme_bloc/theme_bloc_state.dart';
import 'package:fire_chat/presentation/blocs/theme_bloc/theme_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

class MockThemeBloc extends MockBloc<ThemeEvent, ThemeBlocState>
    implements ThemeBloc {}

Future<void> main() async {
  await setup();
  mainBloc();
}

void mainBloc() {
  final box = GetIt.instance.get<Box>();
  group('ThemeBloc', () {
    blocTest<ThemeBloc, ThemeBlocState>(
      'Change theme mode from light to dark',
      build: () => ThemeBloc(mode: ThemeMode.dark, box: box),
      act: (bloc) => bloc.toggleBrightness(),
      expect: () => [ThemeBlocState(themeMode: ThemeMode.light)],
    );

    // By default app has light theme mode??
    blocTest<ThemeBloc, ThemeBlocState>(
      'Toggle system theme mode',
      build: () => ThemeBloc(mode: ThemeMode.system, box: box),
      act: (bloc) => bloc.toggleSystem(),
      expect: () => [ThemeBlocState(themeMode: ThemeMode.light)],
    );
  });
}
