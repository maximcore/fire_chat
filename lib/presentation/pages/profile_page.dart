import 'package:fire_chat/config/routing/routes.dart';
import 'package:fire_chat/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:fire_chat/presentation/blocs/theme_bloc/theme_bloc.dart';
import 'package:fire_chat/presentation/views/profile_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  void onToggleBrightnessPressed(BuildContext context) =>
      context.read<ThemeBloc>().toggleBrightness();

  void onSignOutPressed(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      AppRoutes.loginPageRoute,
      (route) => true,
    );
    context.read<AuthBloc>().signOut();
  }

  @override
  Widget build(BuildContext context) {
    return ProfilePageView(
      onToggleBrightnessPressed: () => onToggleBrightnessPressed(context),
      onSignOutPressed: () => onSignOutPressed(context),
    );
  }
}
