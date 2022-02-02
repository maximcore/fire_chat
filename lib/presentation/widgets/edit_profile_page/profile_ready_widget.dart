import 'package:fire_chat/core/string_constants.dart';
import 'package:fire_chat/presentation/blocs/profile_editing_bloc/profile_editing_bloc_state.dart';
import 'package:fire_chat/presentation/widgets/edit_profile_page/email_editing_text_field.dart';
import 'package:fire_chat/presentation/widgets/edit_profile_page/username_editing_text_field.dart';
import 'package:flutter/material.dart';

class ProfileReadyWidget extends StatelessWidget {
  const ProfileReadyWidget({
    Key? key,
    required this.state,
    required this.onPressed,
    required this.onDeleteProfilePressed,
  }) : super(key: key);

  final ProfileEditingBlocState state;
  final VoidCallback onPressed;
  final VoidCallback onDeleteProfilePressed;

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
                    state.user.profilePictureUrl,
                  ).image,
                ),
                const SizedBox(
                  height: 16,
                ),
                const ElevatedButton(
                  onPressed: null,
                  //onPressed: onPressed,
                  child: Text(AppLocalization.updateAvatar),
                ),
                const SizedBox(
                  height: 16,
                ),
                // UsernameEditingTextField(
                //   initialValue: state.user.username,
                // ),
                EmailEditingTextField(
                  initialValue: state.user.email,
                ),
                ElevatedButton(
                  onPressed: onDeleteProfilePressed,
                  child: const Text(AppLocalization.deleteProfile),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
