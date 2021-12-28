import 'package:fire_chat/core/constants.dart';
import 'package:fire_chat/presentation/blocs/theme_bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

class ThemeBlocWrapper extends StatelessWidget {
  const ThemeBlocWrapper({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final box = GetIt.instance.get<Box>();
    return BlocProvider<ThemeBloc>(
      create: (context) {
        final name = box.get(themeMode) as String?;
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
      child: child,
    );
  }
}
