import 'package:fire_chat/core/string_constants.dart';
import 'package:fire_chat/presentation/blocs/theme_bloc/theme_bloc.dart';
import 'package:fire_chat/presentation/blocs/theme_bloc/theme_bloc_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SystemThemeSettings extends StatelessWidget {
  const SystemThemeSettings({
    Key? key,
    required this.state,
  }) : super(key: key);

  final ThemeBlocState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              AppLocalization.useSystemThemeMode,
            ),
            Switch(
              onChanged: (bool value) {
                context.read<ThemeBloc>().toggleSystem();
              },
              value: state.isSystemThemeMode,
            ),
          ],
        ),
        const Text(
          AppLocalization.useSystemThemeModeDescription,
        ),
      ],
    );
  }
}
