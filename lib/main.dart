import 'package:fire_chat/config/routing/router.dart';
import 'package:fire_chat/config/routing/routes.dart';
import 'package:fire_chat/config/theme.dart';
import 'package:fire_chat/domain/repositories/hardcoded_posts_repository.dart';
import 'package:fire_chat/domain/repositories/posts_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  setup();
  runApp(const MyApp());
}

void setup() {
  GetIt.instance.registerSingleton<PostsRepository>(
    HardcodedPostsRepository(),
  );
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
