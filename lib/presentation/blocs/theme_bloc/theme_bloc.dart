import 'package:fire_chat/core/constants.dart';
import 'package:fire_chat/presentation/blocs/theme_bloc/theme_bloc_state.dart';
import 'package:fire_chat/presentation/blocs/theme_bloc/theme_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeBlocState> {
  ThemeBloc({
    required this.box,
    required ThemeMode mode,
  }) : super(
          ThemeBlocState(
            themeMode: mode,
          ),
        ) {
    on<ChangeThemeEvent>(handleChangeThemeEvent);
    on<SwitchSystemThemeEvent>(handleSwitchSystemThemeEvent);
  }

  final Box box;

  void handleChangeThemeEvent(
    ChangeThemeEvent event,
    Emitter<ThemeBlocState> emit,
  ) {
    if (!state.isSystemThemeMode) {
      if (state.isLightThemeMode) {
        box.put(
          themeMode,
          darkThemeMode,
        );
        emit(
          ThemeBlocState(themeMode: ThemeMode.dark),
        );
      } else {
        box.put(
          themeMode,
          lightThemeMode,
        );
        emit(
          ThemeBlocState(themeMode: ThemeMode.light),
        );
      }
    }
  }

  void handleSwitchSystemThemeEvent(
    SwitchSystemThemeEvent event,
    Emitter<ThemeBlocState> emit,
  ) {
    if (!state.isSystemThemeMode) {
      box.put(
        themeMode,
        systemThemeMode,
      );
      emit(
        ThemeBlocState(themeMode: ThemeMode.system),
      );
    } else {
      box.put(
        themeMode,
        lightThemeMode,
      );
      emit(
        ThemeBlocState(themeMode: ThemeMode.light),
      );
    }
  }
}
