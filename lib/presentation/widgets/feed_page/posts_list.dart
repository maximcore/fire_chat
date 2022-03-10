import 'package:fire_chat/config/routing/routes.dart';
import 'package:fire_chat/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:fire_chat/presentation/blocs/posts_bloc/posts_bloc.dart';
import 'package:fire_chat/presentation/blocs/posts_bloc/posts_bloc_state.dart';
import 'package:fire_chat/presentation/blocs/posts_bloc/posts_events.dart';
import 'package:fire_chat/presentation/widgets/post_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsList extends StatelessWidget {
  const PostsList({Key? key, required this.state}) : super(key: key);

  final PostsBlocState state;

  void _goToChatPage({
    required BuildContext context,
    required String postId,
  }) =>
      Navigator.of(context).pushNamed(
        AppRoutes.postDetailsPageRoute,
        arguments: {'postId': postId},
      );

  void _simulateError(BuildContext context) => context.read<PostsBloc>().add(
        ErrorEvent(),
      );

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      initialItemCount: state.posts!.length,
      itemBuilder: (_, index, __) {
        return PostWidget(
          post: state.posts![index],
          onTap: () {
            _goToChatPage(
              context: context,
              postId: state.posts![index].postId,
            );
          },
          onDoubleTap: () {
            if (index.isOdd) {
              _simulateError(context);
            }
          },
          onLikePressed: () {
            final user = context.read<AuthBloc>().state.user;
            final postId = state.posts![index].postId;
            final userId = user!.id;
            context.read<PostsBloc>().likePost(postId: postId, userId: userId);
          },
        );
      },
    );
  }
}
