import 'package:fire_chat/config/theme_bloc_wrapper.dart';
import 'package:fire_chat/config/routing/router.dart';
import 'package:fire_chat/config/routing/routes.dart';
import 'package:fire_chat/config/theme.dart';
import 'package:fire_chat/injector.dart';
import 'package:fire_chat/presentation/blocs/theme_bloc/theme_bloc.dart';
import 'package:fire_chat/presentation/blocs/theme_bloc/theme_bloc_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  await setup();
  runApp(
    const FireChatApp(),
  );
}

class FireChatApp extends StatelessWidget {
  const FireChatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ThemeBlocWrapper(
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
        return MaterialApp(
          title: 'Fire Chat',
          theme: CustomAppTheme.lightTheme,
          darkTheme: CustomAppTheme.darkTheme,
          themeMode: mode,
          onGenerateRoute: AppRouter.generateRoute,
          initialRoute: AppRoutes.loginPageRoute,
          debugShowCheckedModeBanner: false,
          useInheritedMediaQuery: kIsWeb,
        );
      },
    );
  }
}
