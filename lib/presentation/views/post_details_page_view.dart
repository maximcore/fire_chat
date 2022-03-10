import 'package:fire_chat/core/string_constants.dart';
import 'package:fire_chat/domain/entities/comment_entity/comment_entity.dart';
import 'package:fire_chat/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:fire_chat/presentation/blocs/posts_bloc/posts_bloc.dart';
import 'package:fire_chat/presentation/widgets/add_comment_page/comment_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostDetailsPageView extends StatelessWidget {
  const PostDetailsPageView({
    Key? key,
    required this.postId,
  }) : super(key: key);

  final String postId;

  @override
  Widget build(BuildContext context) {
    final posts = context.read<PostsBloc>().state.posts![int.parse(postId)];
    var comment = '';
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppLocalization.postDetailsPageTitle),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: ListView.builder(
                itemCount: posts.comments.length,
                itemBuilder: (_, index) {
                  return CommentWidget(comment: posts.comments[index]);
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      comment = value;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      hintText: AppLocalization.addComment,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(FontAwesomeIcons.reply),
                  onPressed: () {
                    final user = context.read<AuthBloc>().state.user;
                    context.read<PostsBloc>().commentPost(
                          postId: postId,
                          comment: CommentEntity(
                            comment: comment,
                            user: user!,
                          ),
                        );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
