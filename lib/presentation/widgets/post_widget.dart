import 'package:fire_chat/config/routing/routes.dart';
import 'package:fire_chat/domain/entities/post_entity/post_entity.dart';
import 'package:fire_chat/domain/entities/user_entity/user_entity.dart';
import 'package:fire_chat/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:fire_chat/presentation/blocs/user_profile_bloc/user_profile_bloc.dart';
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
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        PostHeader(post: post),
        if (post.imageUrl != null)
          PostImage(
            post: post,
            size: size,
          ),
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
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: post.user.username,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).textTheme.bodyText1?.color,
                  ),
                ),
                const TextSpan(
                  text: '   ',
                ),
                TextSpan(
                  text: post.description,
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText1?.color,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
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
    return Row(
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
        // IconButton(
        //   onPressed: onTap,
        //   icon: const FaIcon(
        //     FontAwesomeIcons.comment,
        //   ),
        // ),
      ],
    );
  }
}

class PostImage extends StatelessWidget {
  const PostImage({
    Key? key,
    required this.post,
    required this.size,
  }) : super(key: key);

  final PostEntity post;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.3,
      child: Image.network(
        post.imageUrl!,
        fit: BoxFit.cover,
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
    return GestureDetector(
      onTap: () {
        context.read<UserProfileBloc>().initProfile(post.user.id);
        Navigator.of(context).pushNamed(AppRoutes.usersProfile);
      },
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          ClipOval(
            child: Image.network(
              post.user.profilePictureUrl,
              width: 24,
              height: 24,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            post.user.username,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
