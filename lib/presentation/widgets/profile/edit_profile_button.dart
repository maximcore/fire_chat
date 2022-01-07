import 'package:fire_chat/core/string_constants.dart';
import 'package:fire_chat/presentation/pages/edit_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
        EditProfilePage.routeName,
      ),
      child: Column(
        children: const [
          FaIcon(FontAwesomeIcons.userEdit),
          Text(AppLocalization.editProfile),
        ],
      ),
    );
  }
}
