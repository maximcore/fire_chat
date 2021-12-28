import 'package:fire_chat/core/string_constants.dart';
import 'package:fire_chat/presentation/blocs/theme_bloc/theme_bloc.dart';
import 'package:fire_chat/presentation/blocs/theme_bloc/theme_bloc_state.dart';
import 'package:fire_chat/presentation/blocs/theme_bloc/theme_events.dart';
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

  Widget _profileCard(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(
            Icons.person_pin,
            size: 128,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            AppLocalization.username,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 16,
          ),
          _placeholderContainer(context),
          const SizedBox(
            height: 16,
          ),
          _placeholderContainer(context),
          const SizedBox(
            height: 16,
          ),
          _placeholderContainer(context),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
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

  Widget _placeholderContainer(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      height: 16,
      width: 64,
      margin: const EdgeInsets.only(
        left: 32,
        right: 32,
      ),
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
                _profileCard(context),
                _systemThemeSettings(context, state),
              ],
            ),
          ),
        );
      },
    );
  }
}
