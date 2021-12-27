import 'package:fire_chat/injector.dart';
import 'package:fire_chat/presentation/blocs/theme_bloc/theme_bloc_state.dart';
import 'package:fire_chat/presentation/blocs/theme_bloc/theme_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

final _isDarkThemeMode = GetIt.instance.get<Box>().get(isDarkThemeMode) as bool;

class ThemeBloc extends Bloc<ThemeEvent, ThemeBlocState> {
  ThemeBloc({required this.box})
      : super(
          ThemeBlocState(
            themeMode: _isDarkThemeMode ? ThemeBlocMode.dark : ThemeBlocMode.light,
          ),
        ) {
    on<ChangeThemeEvent>((event, emit) {
      if (!state.isSystemThemeMode) {
        if (state.themeMode == ThemeBlocMode.light) {
          box.put(
            isDarkThemeMode,
            true,
          );
          emit(
            ThemeBlocState(themeMode: ThemeBlocMode.dark),
          );
        } else {
          box.put(
            isDarkThemeMode,
            false,
          );
          emit(
            ThemeBlocState(themeMode: ThemeBlocMode.light),
          );
        }
      }
    });
    on<ChangeSystemThemeEvent>((event, emit) {
      {
        if (!state.isSystemThemeMode) {
          emit(
            ThemeBlocState(themeMode: ThemeBlocMode.system),
          );
        } else {
          emit(
            ThemeBlocState(themeMode: ThemeBlocMode.light),
          );
        }
      }
    });
  }

  final Box box;
}
