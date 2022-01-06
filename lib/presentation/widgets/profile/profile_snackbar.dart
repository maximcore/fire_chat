import 'package:fire_chat/core/string_constants.dart';
import 'package:flutter/material.dart';

class ProfileSnackBar extends StatelessWidget {
  const ProfileSnackBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SnackBar(
      backgroundColor: Colors.grey,
      content: Text(
        AppLocalization.changesSaved,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
