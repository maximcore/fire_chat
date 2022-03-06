import 'package:fire_chat/core/string_constants.dart';
import 'package:fire_chat/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:fire_chat/presentation/blocs/auth_bloc/auth_bloc_state.dart';
import 'package:fire_chat/presentation/blocs/theme_bloc/theme_bloc.dart';
import 'package:fire_chat/presentation/blocs/theme_bloc/theme_bloc_state.dart';
import 'package:fire_chat/presentation/blocs/user_profile_bloc/user_profile_bloc.dart';
import 'package:fire_chat/presentation/blocs/user_profile_bloc/user_profile_bloc_state.dart';
import 'package:fire_chat/presentation/widgets/profile_page/profile_card.dart';
import 'package:fire_chat/presentation/widgets/profile_page/system_theme_settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePageView extends StatelessWidget {
  const ProfilePageView({
    Key? key,
    required this.onSignOutPressed,
    required this.onToggleBrightnessPressed,
  }) : super(key: key);

  final VoidCallback onToggleBrightnessPressed;
  final VoidCallback onSignOutPressed;

  List<Widget>? actions(BuildContext context, ThemeBlocState state) {
    return [
      IconButton(
        onPressed: onToggleBrightnessPressed,
        icon: state.isLightThemeMode
            ? const FaIcon(
                FontAwesomeIcons.moon,
              )
            : const FaIcon(
                FontAwesomeIcons.solidSun,
              ),
      ),
      IconButton(
        onPressed: onSignOutPressed,
        icon: const FaIcon(
          FontAwesomeIcons.signOutAlt,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (_, snapshot) {
        return BlocBuilder<AuthBloc, AuthBlocState>(
          builder: (_, authState) {
            switch (authState.status) {
              case AuthBlocStatus.loggedInAnonymously:
              case AuthBlocStatus.loggedInWithEmailAndPassword:
              case AuthBlocStatus.loggedInWithGoogle:
              case AuthBlocStatus.loggedInWithFacebook:
              case AuthBlocStatus.loading:
                return BlocBuilder<UserProfileBloc, UserProfileBlocState>(
                  builder: (context, userProfileBlocState) {
                    return BlocBuilder<ThemeBloc, ThemeBlocState>(
                      builder: (_, builderState) {
                        return Scaffold(
                          appBar: AppBar(
                            actions: actions(context, builderState),
                            title: const Text(AppLocalization.profilePageTitle),
                            centerTitle: true,
                          ),
                          body: SingleChildScrollView(
                            child: snapshot.hasData &&
                                    snapshot.connectionState == ConnectionState.active
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      ProfileCard(
                                        isOwnProfile: true,
                                        // user: FirebaseAuthRepository.userFromFirebaseUser(
                                        //   snapshot.data!,
                                        // ),
                                        user: userProfileBlocState.user!,
                                      ),
                                      SystemThemeSettings(
                                        state: builderState,
                                      ),
                                    ],
                                  )
                                : const CircularProgressIndicator(),
                          ),
                        );
                      },
                    );
                  },
                );
              case AuthBlocStatus.loggedOut:
              case AuthBlocStatus.error:
                return BlocBuilder<ThemeBloc, ThemeBlocState>(
                  builder: (_, builderState) {
                    return Scaffold(
                      appBar: AppBar(
                        actions: actions(context, builderState),
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
      },
    );
  }
}
