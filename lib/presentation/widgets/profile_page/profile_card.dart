import 'package:fire_chat/core/string_constants.dart';
import 'package:fire_chat/domain/entities/user_entity/user_entity.dart';
import 'package:fire_chat/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:fire_chat/presentation/blocs/user_profile_bloc/user_profile_bloc.dart';
import 'package:fire_chat/presentation/widgets/profile_page/edit_profile_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
    required this.user,
    required this.isOwnProfile,
  }) : super(key: key);

  final UserEntity user;
  final bool isOwnProfile;

  @override
  Widget build(BuildContext context) {
    final follower = context.read<AuthBloc>().state.user;
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 16,
          ),
          CircleAvatar(
            radius: 100,
            foregroundImage: Image.network(
              user.profilePictureUrl,
            ).image,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            user.username,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  const Text(AppLocalization.followers),
                  Text('${user.followers.length}'),
                ],
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                children: [
                  const Text(AppLocalization.following),
                  Text('${user.following.length}'),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          if (isOwnProfile)
            const EditProfileButton()
          else
            Padding(
              padding: const EdgeInsets.only(
                left: 64,
                right: 64,
              ),
              child: ElevatedButton(
                onPressed: () => onFollowPressed(
                  context: context,
                  user: user,
                ),
                child: Text(
                  user.followers.contains(follower!.id)
                      ? AppLocalization.unfollow
                      : AppLocalization.follow,
                ),
              ),
            ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }

  void onFollowPressed({
    required BuildContext context,
    required UserEntity user,
  }) {
    final follower = context.read<AuthBloc>().state.user;
    context.read<UserProfileBloc>().followUser(
          uid: user.id,
          followerId: follower!.id,
        );
  }
}
