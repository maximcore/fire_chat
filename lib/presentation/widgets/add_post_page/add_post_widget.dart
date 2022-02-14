import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:fire_chat/core/string_constants.dart';
import 'package:fire_chat/domain/entities/post_entity/post_entity.dart';
import 'package:fire_chat/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:fire_chat/presentation/blocs/create_post_bloc/create_post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPostWidget extends StatelessWidget {
  const AddPostWidget({
    Key? key,
    required this.blocBuilderContext,
  }) : super(key: key);

  final BuildContext blocBuilderContext;

  void uploadImage(CreatePostBloc bloc) {
    final user = blocBuilderContext.read<AuthBloc>().state.user!;
    final post = PostEntity(
      description: bloc.state.description!,
      user: user,
    );
    bloc.uploadImageToStorage(
      post,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = blocBuilderContext.read<CreatePostBloc>();
    return Column(
      children: [
        const Text(AppLocalization.description),
        Padding(
          padding: const EdgeInsets.all(18),
          child: TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            onChanged: (String? value) {
              bloc.editDescription(value!);
            },
            maxLines: 5,
          ),
        ),
        if (bloc.state.result?.files.single.path == null)
          const SizedBox()
        else
          Image.file(
            File(bloc.state.result?.files.single.path as String),
            width: 100,
            height: 150,
          ),
        ElevatedButton(
          onPressed: () async {
            final result = await FilePicker.platform.pickFiles(
              type: FileType.custom,
              allowedExtensions: [
                'png',
                'jpg',
              ],
            );
            if (result != null) {
              bloc.editImage(result);
              //context.read<PostsBloc>().
            }
          },
          child: const Text(
            AppLocalization.uploadImageText,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            uploadImage(bloc);
            Navigator.of(blocBuilderContext).pop();
          },
          child: const Text(
            AppLocalization.addPostText,
          ),
        ),
      ],
    );
  }
}
