import 'package:fire_chat/presentation/views/post_details_page_view.dart';
import 'package:flutter/material.dart';

class PostDetailsPage extends StatelessWidget {
  const PostDetailsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final postId = args['postId'] as String;
    return  PostDetailsPageView(
      postId: postId,
    );
  }
}
