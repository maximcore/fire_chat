import 'package:fire_chat/config/wrappers/common/auth_bloc_wrapper.dart';
import 'package:fire_chat/config/wrappers/common/profile_editing_bloc_wrapper.dart';
import 'package:fire_chat/config/wrappers/common/theme_bloc_wrapper.dart';
import 'package:flutter/material.dart';

class BlocsAppWrapper extends StatelessWidget {
  const BlocsAppWrapper({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AuthBlocWrapper(
      child: ThemeBlocWrapper(
        child: ProfileEditingBlocWrapper(
          child: child,
        ),
      ),
    );
  }
}
