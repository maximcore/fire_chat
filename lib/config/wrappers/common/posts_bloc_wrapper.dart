import 'package:fire_chat/domain/repositories/posts_repository/posts_repository.dart';
import 'package:fire_chat/presentation/blocs/posts_bloc/posts_bloc.dart';
import 'package:fire_chat/presentation/blocs/posts_bloc/posts_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class PostsBlocWrapper extends StatelessWidget {
  const PostsBlocWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final repository = GetIt.instance.get<PostsRepository>();
    return BlocProvider<PostsBloc>(
      create: (_) => PostsBloc(repository: repository)
        ..add(
          FetchingDataEvent(),
        ),
      child: child,
    );
  }
}
