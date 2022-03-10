import 'package:fire_chat/domain/entities/comment_entity/comment_entity.dart';
import 'package:flutter/material.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({
    Key? key,
    required this.comment,
  }) : super(key: key);

  final CommentEntity comment;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 16,
          width: 16,
          child: Image.network(comment.user.profilePictureUrl),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: comment.user.username,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).textTheme.bodyText1?.color,
                ),
              ),
              const TextSpan(
                text: '   ',
              ),
              TextSpan(
                text: comment.comment,
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText1?.color,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
