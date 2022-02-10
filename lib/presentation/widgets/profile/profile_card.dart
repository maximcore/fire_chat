import 'package:fire_chat/domain/entities/user_entity/user_entity.dart';
import 'package:fire_chat/presentation/widgets/common/placeholder_container.dart';
import 'package:fire_chat/presentation/widgets/profile/edit_profile_button.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
    required this.user,
  }) : super(key: key);

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
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
          const EditProfileButton(),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
