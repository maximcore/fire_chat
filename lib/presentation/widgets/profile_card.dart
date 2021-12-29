import 'package:fire_chat/core/string_constants.dart';
import 'package:fire_chat/presentation/widgets/common/placeholder_container.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key}) : super(key: key);

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
          Icon(
            Icons.person_pin,
            size: 128,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            AppLocalization.username,
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
