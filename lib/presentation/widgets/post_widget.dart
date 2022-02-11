import 'package:fire_chat/domain/entities/post_entity/post_entity.dart';
import 'package:fire_chat/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({
    Key? key,
    required this.post,
    this.onTap,
    this.onDoubleTap,
    this.onLikePressed,
  }) : super(key: key);

  final PostEntity post;
  final VoidCallback? onTap;
  final VoidCallback? onDoubleTap;
  final VoidCallback? onLikePressed;

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthBloc>().state.user;
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height / 2.5,
      child: Card(
        margin: const EdgeInsets.only(top: 8, bottom: 8, left: 32, right: 32),
        color: Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                color: Colors.greenAccent[100],
                padding: const EdgeInsets.only(
                  left: 12,
                  right: 12,
                  top: 6,
                ),
                //color: Colors.greenAccent,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 10,
                      foregroundImage: Image.network(
                        post.user.profilePictureUrl,
                      ).image,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      post.user.username,
                    ),
                  ],
                ),
              ),
            ),
            if (post.imageUrl != null)
              Expanded(
                flex: 8,
                child: Container(
                  color: Colors.purple[100],
                  child: Image.network(
                    post.imageUrl!,
                    // height: 100,
                    // width: 100,
                  ),
                ),
              ),
            Expanded(
              child: Container(
                color: Colors.greenAccent[100],
                child: Text(
                  post.description,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.purple[100],
                padding: const EdgeInsets.only(
                  left: 12,
                  right: 12,
                  bottom: 6,
                ),
                //color: Colors.deepPurpleAccent,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: onLikePressed,
                      icon: const FaIcon(
                        FontAwesomeIcons.heart,
                      ),
                      color: post.postLikedByUsers.contains(user?.id)
                          ? Colors.red
                          : Colors.white,
                    ),
                    IconButton(
                      onPressed: onTap,
                      icon: const FaIcon(
                        FontAwesomeIcons.comment,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
