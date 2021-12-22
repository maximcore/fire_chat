import 'package:fire_chat/data/repositories/posts_repository.dart';
import 'package:fire_chat/routing/router.dart';
import 'package:fire_chat/routing/routes.dart';
import 'package:fire_chat/theme.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  setup();
  runApp(const MyApp());
}

void setup() {
  GetIt.instance.registerSingleton<PostsRepository>(
    FakerPostsRepository(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Faker Fire Chat',
      theme: customAppTheme(),
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: AppRoutes.loginPageRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
