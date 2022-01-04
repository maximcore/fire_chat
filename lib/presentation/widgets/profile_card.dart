import 'package:fire_chat/core/string_constants.dart';
import 'package:fire_chat/domain/entities/user_entity/user_entity.dart';
import 'package:fire_chat/domain/repositories/user_repository/user_repository.dart';
import 'package:fire_chat/presentation/widgets/common/placeholder_container.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
    required this.user,
  }) : super(key: key);

  final UserEntity? user;

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
          Image.network(
            user!.profilePictureUrl,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            user!.username,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 16,
          ),
          const PlaceholderContainer(),
          const SizedBox(
            height: 16,
          ),
          const PlaceholderContainer(),
          const SizedBox(
            height: 16,
          ),
          const PlaceholderContainer(),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
