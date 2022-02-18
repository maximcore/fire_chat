import 'package:fire_chat/presentation/blocs/posts_bloc/posts_bloc.dart';
import 'package:fire_chat/presentation/views/feed_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  void fetchPosts(BuildContext context) =>
      context.read<PostsBloc>().fetchPosts();

  @override
  Widget build(BuildContext context) {
    return FeedPageView(
      fetchPosts: () => fetchPosts(context),
    );
  }
}
