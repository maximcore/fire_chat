import 'package:fire_chat/core/string_constants.dart';
import 'package:fire_chat/presentation/blocs/create_post_bloc/create_post_bloc.dart';
import 'package:fire_chat/presentation/blocs/create_post_bloc/create_post_bloc_state.dart';
import 'package:fire_chat/presentation/widgets/add_post_page/add_post_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPostPageView extends StatelessWidget {
  const AddPostPageView({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final Function(BuildContext context) onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreatePostBloc, CreatePostBlocState>(
      builder: (blocBuilderContext, state) {
        return Scaffold(
          appBar: state.isUnmodified()
              ? AppBar(
                  centerTitle: true,
                  title: const Text(AppLocalization.addPostPageTitle),
                )
              : AppBar(
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                  actions: [
                    IconButton(
                      onPressed: () async {
                        await onPressed(context);
                      },
                      icon: const Icon(
                        Icons.cancel_outlined,
                      ),
                    ),
                  ],
                  title: const Text(AppLocalization.addPostPageTitle),
                ),
          body: SafeArea(
            child: Column(
              children: [
                AddPostWidget(blocBuilderContext: blocBuilderContext),
              ],
            ),
          ),
        );
      },
    );
  }
}
