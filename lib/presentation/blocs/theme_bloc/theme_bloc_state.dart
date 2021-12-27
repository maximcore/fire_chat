import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_bloc_state.freezed.dart';

enum ThemeBlocMode {light, dark, system}

@freezed
class ThemeBlocState with _$ThemeBlocState {
  factory ThemeBlocState({
    required ThemeBlocMode themeMode,
  }) = _ThemeBlocState;

  const ThemeBlocState._();

  bool get isSystemThemeMode => themeMode == ThemeBlocMode.system;
}
