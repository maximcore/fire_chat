import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_bloc_state.freezed.dart';

@freezed
class ThemeBlocState with _$ThemeBlocState {
  factory ThemeBlocState({
    required ThemeMode themeMode,
  }) = _ThemeBlocState;

  const ThemeBlocState._();

  bool get isSystemThemeMode => themeMode == ThemeMode.system;

  bool get isDarkThemeMode => themeMode == ThemeMode.dark;

  bool get isLightThemeMode => themeMode == ThemeMode.light;
}
