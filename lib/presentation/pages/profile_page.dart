import 'package:fire_chat/core/string_constants.dart';
import 'package:fire_chat/presentation/blocs/theme_bloc/theme_bloc.dart';
import 'package:fire_chat/presentation/blocs/theme_bloc/theme_bloc_state.dart';
import 'package:fire_chat/presentation/blocs/theme_bloc/theme_events.dart';
import 'package:fire_chat/presentation/widgets/profile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  void _handleChangeThemeEvent(BuildContext context) {
    context.read<ThemeBloc>().add(
          ChangeThemeEvent(),
        );
  }

  void _handleSwitchSystemThemeEvent(BuildContext context) {
    context.read<ThemeBloc>().add(
          SwitchSystemThemeEvent(),
        );
  }

  Widget _systemThemeSettings(BuildContext context, ThemeBlocState state) {
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
                _handleSwitchSystemThemeEvent(context);
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

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<ThemeBloc>(context);
    return BlocBuilder<ThemeBloc, ThemeBlocState>(
      bloc: bloc,
      builder: (_, state) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  _handleChangeThemeEvent(context);
                },
                icon: state.isLightThemeMode
                    ? const FaIcon(
                        FontAwesomeIcons.moon,
                      )
                    : const FaIcon(
                        FontAwesomeIcons.sun,
                      ),
              ),
            ],
            title: const Text(AppLocalization.profilePageTitle),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const ProfileCard(),
                _systemThemeSettings(context, state),
              ],
            ),
          ),
        );
      },
    );
  }
}
