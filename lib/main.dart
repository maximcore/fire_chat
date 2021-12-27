import 'package:fire_chat/config/fire_chat_app_manager.dart';
import 'package:fire_chat/config/routing/router.dart';
import 'package:fire_chat/config/routing/routes.dart';
import 'package:fire_chat/config/theme.dart';
import 'package:fire_chat/injector.dart';
import 'package:fire_chat/presentation/blocs/theme_bloc/theme_bloc.dart';
import 'package:fire_chat/presentation/blocs/theme_bloc/theme_bloc_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  await setup();
  runApp(
    const ThemeBlocWrapper(
      child: FireChatApp(),
    ),
  );
}

class FireChatApp extends StatelessWidget {
  const FireChatApp({Key? key}) : super(key: key);

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
        );
      },
    );
  }
}
