import 'package:fire_chat/config/routing/routes.dart';
import 'package:fire_chat/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:fire_chat/presentation/blocs/posts_bloc/posts_bloc.dart';
import 'package:fire_chat/presentation/blocs/user_profile_bloc/user_profile_bloc.dart';
import 'package:fire_chat/presentation/views/home_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void fetchPosts(BuildContext context) => context.read<PostsBloc>().fetchPosts();

  void goToChats(BuildContext context) => Navigator.pushNamed(
        context,
        AppRoutes.chatPageRoute,
      );

  void goToProfile(BuildContext context) {
    final user = context.read<AuthBloc>().state.user;
    context.read<UserProfileBloc>().initProfile(user!.id);
    Navigator.pushNamed(
      context,
      AppRoutes.profilePageRoute,
    );
  }

  void goToAddPostPage(BuildContext context) => Navigator.of(context).pushNamed(
        AppRoutes.addPostPage,
      );

  void onFilterPressed(BuildContext context) {
    final user = context.read<AuthBloc>().state.user;
    context.read<PostsBloc>().fetchFollowingUsersPosts(user!.id);
  }

  @override
  Widget build(BuildContext context) {
    return HomePageView(
      onFilterPressed: () => onFilterPressed(context),
      fetchPosts: () => fetchPosts(context),
      goToChats: () => goToChats(context),
      goToProfile: () => goToProfile(context),
      goToAddPostPage: () => goToAddPostPage(context),
    );
  }
}
