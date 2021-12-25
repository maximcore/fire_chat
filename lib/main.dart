import 'package:fire_chat/config/routing/router.dart';
import 'package:fire_chat/config/routing/routes.dart';
import 'package:fire_chat/config/theme.dart';
import 'package:fire_chat/injector.dart';
import 'package:fire_chat/presentation/blocs/theme_bloc/theme_bloc.dart';
import 'package:fire_chat/presentation/blocs/theme_bloc/theme_bloc_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setup();
  runApp(
    BlocProvider<ThemeBloc>(
      create: (context) => ThemeBloc(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeBlocState>(
      bloc: BlocProvider.of<ThemeBloc>(context),
      builder: (context, state) {
        return MaterialApp(
          title: 'Fire Chat',
          theme: state.status == ThemeBlocStatus.light
              ? customAppTheme()
              : customAppThemeDark(),
          onGenerateRoute: AppRouter.generateRoute,
          initialRoute: AppRoutes.loginPageRoute,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
