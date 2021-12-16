import 'package:fire_chat/routing/router.dart';
import 'package:fire_chat/routing/routes.dart';
import 'package:fire_chat/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fire Chat',
      theme: customAppTheme(),
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: AppRoutes.loginPageRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
