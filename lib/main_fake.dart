import 'package:fire_chat/config/routing/router.dart';
import 'package:fire_chat/config/routing/routes.dart';
import 'package:fire_chat/config/theme.dart';
import 'package:fire_chat/injector.dart';
import 'package:flutter/material.dart';

void main() {
  setupFake();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Faker Fire Chat',
      theme: CustomAppTheme.lightTheme,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: AppRoutes.loginPageRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
