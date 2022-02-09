import 'package:cloud_functions/cloud_functions.dart';
import 'package:fire_chat/config/routing/routes.dart';
import 'package:fire_chat/core/string_constants.dart';
import 'package:fire_chat/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:fire_chat/presentation/blocs/posts_bloc/posts_bloc.dart';
import 'package:fire_chat/presentation/blocs/posts_bloc/posts_bloc_state.dart';
import 'package:fire_chat/presentation/blocs/posts_bloc/posts_events.dart';
import 'package:fire_chat/presentation/widgets/post_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  Widget _errorBanner(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          AppLocalization.tryAgainText,
          textAlign: TextAlign.center,
        ),
        Column(
          children: [
            IconButton(
              onPressed: () {
                context.read<PostsBloc>().add(FetchingDataEvent());
              },
              icon: const Icon(Icons.ac_unit_sharp),
            ),
          ],
        )
      ],
    );
  }

  Widget _postsList(BuildContext context, PostsBlocState state) {
    return ListView.builder(
      itemCount: state.posts!.length,
      itemBuilder: (_, index) {
        return PostWidget(
          post: state.posts![index],
          onTap: () {
            _goToChatPage(context);
          },
          onDoubleTap: () {
            if (index.isOdd) {
              _simulateError(context);
            }
          },
          onLikePressed: () async {
            final callable = FirebaseFunctions.instanceFor(
              region: 'europe-west3',
            ).httpsCallable('likePost');
            final user = context.read<AuthBloc>().state.user;
            final res = await callable.call<Map>(<String, dynamic>{
              'user': user?.id,
              'postId': state.posts![index].postId,
            });
            //print(res.data);
          },
        );
      },
    );
  }

  void _goToChatPage(BuildContext context) =>
      Navigator.of(context).pushNamed(AppRoutes.postDetailsPageRoute);

  void _simulateError(BuildContext context) =>
      context.read<PostsBloc>().add(ErrorEvent());

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: constraints.maxHeight,
          ),
          child: BlocBuilder<PostsBloc, PostsBlocState>(
            builder: (_, state) {
              switch (state.status) {
                case PostsBlocStatus.initial:
                case PostsBlocStatus.loading:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case PostsBlocStatus.ready:
                  return _postsList(context, state);
                case PostsBlocStatus.error:
                  return _errorBanner(context);
              }
            },
          ),
        );
      },
    );
  }
}
