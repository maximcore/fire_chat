import 'package:fire_chat/blocs/posts_bloc/posts_bloc.dart';
import 'package:fire_chat/blocs/posts_bloc/posts_bloc_state.dart';
import 'package:fire_chat/blocs/posts_bloc/posts_events.dart';
import 'package:fire_chat/routing/routes.dart';
import 'package:fire_chat/widgets/post_widget.dart';
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
          'Something went wrong, try again',
          style: TextStyle(
            color: Colors.black,
          ),
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
    final bloc = BlocProvider.of<PostsBloc>(context);
    return LayoutBuilder(
      builder: (_, constraints) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: constraints.maxHeight,
          ),
          child: BlocBuilder<PostsBloc, PostsBlocState>(
            bloc: bloc,
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
