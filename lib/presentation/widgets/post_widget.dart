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
    return GestureDetector(
      onTap: onTap,
      //onDoubleTap: onDoubleTap,
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
                  CircleAvatar(
                    radius: 10,
                    foregroundImage: Image.network(
                      post.user.profilePictureUrl,
                    ).image,
                  ),
                  Text(
                    post.user.username,
                  ),
                ],
              ),
              Text(
                post.description,
                textAlign: TextAlign.center,
              ),
              Row(
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
