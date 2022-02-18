import 'package:fire_chat/presentation/blocs/create_post_bloc/create_post_bloc.dart';
import 'package:fire_chat/presentation/blocs/create_post_bloc/create_post_bloc_state.dart';
import 'package:fire_chat/presentation/blocs/posts_bloc/posts_bloc.dart';
import 'package:fire_chat/presentation/blocs/posts_bloc/posts_bloc_state.dart';
import 'package:fire_chat/presentation/widgets/feed_page/error_banner.dart';
import 'package:fire_chat/presentation/widgets/feed_page/posts_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostsBloc, PostsBlocState>(
      listener: (context, state) {
        if (context.read<CreatePostBloc>().state.status ==
            CreatePostBlocStatus.ready) {
          context.read<PostsBloc>().fetchPosts();
        }
      },
      builder: (_, state) {
        switch (state.status) {
          case PostsBlocStatus.initial:
          case PostsBlocStatus.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case PostsBlocStatus.ready:
            return PostsList(
              state: state,
            );
          case PostsBlocStatus.error:
            return const ErrorBanner();
        }
      },
    );
  }
}
