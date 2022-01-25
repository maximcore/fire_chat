import 'package:fire_chat/core/string_constants.dart';
import 'package:fire_chat/domain/entities/post_entity/post_entity.dart';
import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({
    Key? key,
    required this.post,
    this.onTap,
    this.onDoubleTap,
  }) : super(key: key);

  final PostEntity post;
  final VoidCallback? onTap;
  final VoidCallback? onDoubleTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      child: SizedBox(
        height: 160,
        child: Card(
          margin: const EdgeInsets.only(top: 8, bottom: 8, left: 32, right: 32),
          color: Theme.of(context).cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.account_circle_rounded),
                  Text(
                    post.username,
                  ),
                ],
              ),
              Text(
                post.description,
                textAlign: TextAlign.center,
              ),
              const Text(
                AppLocalization.postDetailsText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}