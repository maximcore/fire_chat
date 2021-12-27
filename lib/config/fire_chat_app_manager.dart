import 'package:fire_chat/presentation/blocs/theme_bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

class FireChatAppManager extends StatelessWidget {
  const FireChatAppManager({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final box = GetIt.instance.get<Box>();
    return BlocProvider<ThemeBloc>(
      create: (context) => ThemeBloc(box: box),
      child: child,
    );
  }
}
