import 'package:fire_chat/domain/repositories/posts_repository/posts_repository.dart';
import 'package:fire_chat/domain/repositories/storage_repository/storage_repository.dart';
import 'package:fire_chat/presentation/blocs/create_post_bloc/create_post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CreatePostBlocWrapper extends StatelessWidget {
  const CreatePostBlocWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final postsRepository = GetIt.instance.get<PostsRepository>();
    final storageRepository = GetIt.instance.get<StorageRepository>();
    return BlocProvider<CreatePostBloc>(
      create: (_) => CreatePostBloc(
        postsRepository: postsRepository,
        storageRepository: storageRepository,
      ),
      child: child,
    );
  }
}
