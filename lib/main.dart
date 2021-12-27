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
    const FireChatAppManager(
      child: FireChatApp(),
    ),
  );
}

class FireChatApp extends StatelessWidget {
  const FireChatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeBlocState>(
      bloc: BlocProvider.of<ThemeBloc>(context),
      builder: (context, state) {
        return MaterialApp(
          title: 'Fire Chat',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: state.isSystemThemeMode
              ? ThemeMode.system
              : (state.themeMode == ThemeBlocMode.light ? ThemeMode.light : ThemeMode.dark),
          onGenerateRoute: AppRouter.generateRoute,
          initialRoute: AppRoutes.loginPageRoute,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
