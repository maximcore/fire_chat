import 'package:fire_chat/core/string_constants.dart';
import 'package:fire_chat/presentation/blocs/profile_editing_bloc/profile_editing_bloc_state.dart';
import 'package:fire_chat/presentation/widgets/edit_profile_page/username_text_form_field.dart';
import 'package:flutter/material.dart';

class ProfileReadyWidget extends StatelessWidget {
  const ProfileReadyWidget({
    Key? key,
    required this.state,
    required this.onPressed,
  }) : super(key: key);

  final ProfileEditingBlocState state;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                CircleAvatar(
                  radius: 100,
                  foregroundImage: Image.network(
                    state.user!.profilePictureUrl,
                  ).image,
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: onPressed,
                  child: const Text(AppLocalization.updateAvatar),
                ),
                const SizedBox(
                  height: 16,
                ),
                UsernameTextFormField(
                  initialValue: state.user!.username,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 32,
                    right: 32,
                    bottom: 8,
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: AppLocalization.email,
                    ),
                    initialValue: state.user!.email,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
