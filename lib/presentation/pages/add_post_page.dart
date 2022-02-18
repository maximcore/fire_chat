import 'package:fire_chat/presentation/blocs/create_post_bloc/create_post_bloc.dart';
import 'package:fire_chat/presentation/views/add_post_page_view.dart';
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
    return AddPostPageView(
      onPressed: onPressed,
    );
  }
}
