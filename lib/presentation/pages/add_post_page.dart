import 'package:fire_chat/core/string_constants.dart';
import 'package:fire_chat/domain/entities/post_entity/post_entity.dart';
import 'package:fire_chat/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:fire_chat/presentation/blocs/posts_bloc/posts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPostPage extends StatelessWidget {
  const AddPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppLocalization.addPostPageTitle),
      ),
      body: SafeArea(
        child: Column(
          children: [
            addPostWidget(context),
          ],
        ),
      ),
    );
  }

  Widget addPostWidget(BuildContext context) {
    String description = '';
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: TextField(
            onChanged: (String? value) {
              description = value!;
            },
            maxLines: 5,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            final user = context.read<AuthBloc>().state.user!;
            final post = PostEntity(
              description: description,
              user: user,
            );
            context.read<PostsBloc>().addPost(
                  post: post,
                  user: user,
                );
            Navigator.of(context).pop();
          },
          child: const Text(AppLocalization.addPostText,),
        ),
      ],
    );
  }
}
