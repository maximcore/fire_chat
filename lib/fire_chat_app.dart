import 'package:fire_chat/config/routing/router.dart';
import 'package:fire_chat/config/routing/routes.dart';
import 'package:fire_chat/config/theme.dart';
import 'package:fire_chat/config/wrappers/blocs_app_wrapper.dart';
import 'package:fire_chat/presentation/blocs/profile_existence_bloc/profile_existence_bloc.dart';
import 'package:fire_chat/presentation/blocs/profile_existence_bloc/profile_existence_bloc_state.dart';
import 'package:fire_chat/presentation/blocs/theme_bloc/theme_bloc.dart';
import 'package:fire_chat/presentation/blocs/theme_bloc/theme_bloc_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FireChatApp extends StatelessWidget {
  const FireChatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BlocsAppWrapper(
      child: DynamicThemeApp(),
    );
  }
}

class DynamicThemeApp extends StatelessWidget {
  const DynamicThemeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ThemeBloc, ThemeBlocState, ThemeMode>(
      selector: (state) => state.themeMode,
      builder: (context, mode) {
        return BlocBuilder<ProfileExistenceBloc, ProfileExistenceBlocState>(
          builder: (context, profileState) {
            return MaterialApp(
              title: 'Fire Chat',
              theme: CustomAppTheme.lightTheme,
              darkTheme: CustomAppTheme.darkTheme,
              themeMode: mode,
              onGenerateRoute: AppRouter.generateRoute,
              initialRoute:
                  profileState.status == ProfileExistenceBlocStatus.notExists
                      ? AppRoutes.loginPageRoute
                      : AppRoutes.homePageRoute,
              debugShowCheckedModeBanner: false,
              useInheritedMediaQuery: kIsWeb,
            );
          },
        );
      },
    );
  }
}
