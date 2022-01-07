import 'package:fire_chat/core/string_constants.dart';
import 'package:flutter/material.dart';

class ProfileInitializingWidget extends StatelessWidget {
  const ProfileInitializingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircularProgressIndicator(),
          SizedBox(
            height: 16,
          ),
          Text(AppLocalization.initializing),
        ],
      ),
    );
  }
}
