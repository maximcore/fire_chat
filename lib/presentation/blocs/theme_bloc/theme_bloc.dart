import 'package:fire_chat/presentation/blocs/theme_bloc/theme_bloc_state.dart';
import 'package:fire_chat/presentation/blocs/theme_bloc/theme_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeBlocState> {
  ThemeBloc() : super(ThemeBlocState(status: ThemeBlocStatus.light)) {
    on<ChangeThemeEvent>((event, emit) {
      if (state.status == ThemeBlocStatus.light) {
        emit(
          ThemeBlocState(status: ThemeBlocStatus.dark),
        );
      } else {
        emit(
          ThemeBlocState(status: ThemeBlocStatus.light),
        );
      }
    });
  }
}
