import 'package:fire_chat/core/string_constants.dart';
import 'package:fire_chat/presentation/blocs/create_post_bloc/create_post_bloc.dart';
import 'package:fire_chat/presentation/blocs/create_post_bloc/create_post_bloc_state.dart';
import 'package:fire_chat/presentation/widgets/add_post_page/add_post_widget.dart';
import 'package:fire_chat/presentation/widgets/add_post_page/discard_post_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPostPage extends StatelessWidget {
  const AddPostPage({Key? key}) : super(key: key);

  Future<void> onPressed(BuildContext context) async {
    await showDialog<dynamic>(
      useRootNavigator: false,
      context: context,
      builder: (builderContext) {
        context.read<CreatePostBloc>().discard();
        return DiscardPostAlertDialog(
          context: context,
          builderContext: builderContext,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreatePostBloc, CreatePostBlocState>(
      builder: (blocBuilderContext, state) {
        return Scaffold(
          appBar: AppBar(
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
