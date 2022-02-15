import 'package:fire_chat/domain/entities/post_entity/post_entity.dart';
import 'package:fire_chat/domain/entities/user_entity/user_entity.dart';
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PostHeader(post: post),
          if (post.imageUrl != null) PostImage(post: post),
          PostActionButtons(
            onLikePressed: onLikePressed,
            post: post,
            user: user,
            onTap: onTap,
          ),
          PostDescription(post: post),
          const Divider(
            thickness: 0.5,
          ),
        ],
      ),
    );
  }
}

class PostDescription extends StatelessWidget {
  const PostDescription({
    Key? key,
    required this.post,
  }) : super(key: key);

  final PostEntity post;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          Text(
            post.user.username,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
            // textAlign: TextAlign.center,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            post.description,
            // textAlign: TextAlign.center,
          ),

        ],
      ),
    );
  }
}

class PostActionButtons extends StatelessWidget {
  const PostActionButtons({
    Key? key,
    required this.onLikePressed,
    required this.post,
    required this.user,
    required this.onTap,
  }) : super(key: key);

  final VoidCallback? onLikePressed;
  final PostEntity post;
  final UserEntity? user;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          IconButton(
            onPressed: onLikePressed,
            icon: FaIcon(
              post.postLikedByUsers.contains(user?.id)
                  ? FontAwesomeIcons.solidHeart
                  : FontAwesomeIcons.heart,
            ),
            color: post.postLikedByUsers.contains(user?.id)
                ? Colors.red
                : Theme.of(context).primaryIconTheme.color,
          ),
          IconButton(
            onPressed: onTap,
            icon: const FaIcon(
              FontAwesomeIcons.comment,
            ),
          )
        ],
      ),
    );
  }
}

class PostImage extends StatelessWidget {
  const PostImage({
    Key? key,
    required this.post,
  }) : super(key: key);

  final PostEntity post;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 7,
      child: SizedBox(
        width: double.infinity,
        child: FittedBox(
          fit: BoxFit.fill,
          child: Image.network(
            post.imageUrl!,
          ),
        ),
      ),
    );
  }
}

class PostHeader extends StatelessWidget {
  const PostHeader({
    Key? key,
    required this.post,
  }) : super(key: key);

  final PostEntity post;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: CircleAvatar(
              radius: 10,
              foregroundImage: Image.network(
                post.user.profilePictureUrl,
              ).image,
            ),
          ),
          Expanded(
            flex: 6,
            child: Text(
              post.user.username,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Expanded(
            flex: 6,
            child: SizedBox(),
          )
        ],
      ),
    );
  }
}
