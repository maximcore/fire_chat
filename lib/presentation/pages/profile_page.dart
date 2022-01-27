import 'package:fire_chat/config/routing/routes.dart';
import 'package:fire_chat/core/string_constants.dart';
import 'package:fire_chat/domain/entities/user_entity/user_entity.dart';
import 'package:fire_chat/domain/repositories/auth_repository/firebase_auth_repository.dart';
import 'package:fire_chat/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:fire_chat/presentation/blocs/auth_bloc/auth_bloc_events.dart';
import 'package:fire_chat/presentation/blocs/auth_bloc/auth_bloc_state.dart';
import 'package:fire_chat/presentation/blocs/theme_bloc/theme_bloc.dart';
import 'package:fire_chat/presentation/blocs/theme_bloc/theme_bloc_state.dart';
import 'package:fire_chat/presentation/widgets/profile/profile_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

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

  List<Widget>? _actions(BuildContext context, ThemeBlocState state) {
    return [
      IconButton(
        onPressed: () {
          context.read<ThemeBloc>().toggleBrightness();
        },
        icon: state.isLightThemeMode
            ? const FaIcon(
                FontAwesomeIcons.moon,
              )
            : const FaIcon(
                FontAwesomeIcons.sun,
              ),
      ),
      IconButton(
        onPressed: () {
          Navigator.of(context).pushNamedAndRemoveUntil(
            AppRoutes.loginPageRoute,
            (route) => true,
          );
          context.read<AuthBloc>().signOut();
        },
        icon: const FaIcon(
          FontAwesomeIcons.signOutAlt,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthBlocState>(
      builder: (_, authState) {
        switch (authState.status) {
          case AuthBlocStatus.loggedInAnonymously:
          case AuthBlocStatus.loggedInWithEmailAndPassword:
          case AuthBlocStatus.loading:
            return BlocBuilder<ThemeBloc, ThemeBlocState>(
              builder: (_, builderState) {
                return Scaffold(
                  appBar: AppBar(
                    actions: _actions(context, builderState),
                    title: const Text(AppLocalization.profilePageTitle),
                    centerTitle: true,
                  ),
                  body: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ProfileCard(user: authState.user!),
                        _systemThemeSettings(context, builderState),
                      ],
                    ),
                  ),
                );
              },
            );
          case AuthBlocStatus.loggedOut:
            return BlocBuilder<ThemeBloc, ThemeBlocState>(
              builder: (_, builderState) {
                return Scaffold(
                  appBar: AppBar(
                    actions: _actions(context, builderState),
                    title: const Text(AppLocalization.profilePageTitle),
                    centerTitle: true,
                  ),
                  body: const SingleChildScrollView(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                );
              },
            );
        }
      },
    );
  }
}
