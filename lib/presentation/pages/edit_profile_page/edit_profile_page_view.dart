import 'package:fire_chat/core/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditProfilePageView extends StatelessWidget {
  const EditProfilePageView({
    Key? key,
    required this.showSnackBar,
  }) : super(key: key);

  final VoidCallback showSnackBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              
            },
            icon: const FaIcon(
              FontAwesomeIcons.solidSave,
            ),
          ),
        ],
        title: const Text(
          AppLocalization.editProfilePageTitle,
        ),
        centerTitle: true,
      ),
      body: const Center(),
    );
  }
}
