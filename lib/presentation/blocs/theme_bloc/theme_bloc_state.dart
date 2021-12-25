import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_bloc_state.freezed.dart';

enum ThemeBlocStatus {light, dark}

@freezed
class ThemeBlocState with _$ThemeBlocState {
  factory ThemeBlocState({
    required ThemeBlocStatus status
}) = _ThemeBlocState;
}