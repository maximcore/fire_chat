import 'package:fire_chat/routing/defined_routes_export.dart';
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
      initialRoute: AppRoutes.loginPageRoute,
      routes: {
        AppRoutes.chatPageRoute: (context) => const ChatPage(),
        AppRoutes.homePageRoute: (context) => const HomePage(),
        AppRoutes.loginPageRoute: (context) => LoginPage(),
        AppRoutes.postDetailsPageRoute: (context) => const PostDetailsPage(),
        AppRoutes.profilePageRoute: (context) => const ProfilePage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
