import 'package:fire_chat/blocs/posts_bloc/posts_bloc.dart';
import 'package:fire_chat/blocs/posts_bloc/posts_events.dart';
import 'package:fire_chat/data/repositories/posts_repository.dart';
import 'package:fire_chat/routing/router.dart';
import 'package:fire_chat/routing/routes.dart';
import 'package:fire_chat/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PostsBloc(PostsRepository.instance)
        ..add(
          FetchingDataEvent(),
        ),
      child: MaterialApp(
        title: 'Fire Chat',
        theme: customAppTheme(),
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: AppRoutes.loginPageRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
