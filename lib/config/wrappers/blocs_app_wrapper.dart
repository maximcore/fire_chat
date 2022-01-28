import 'package:fire_chat/config/wrappers/common/auth_bloc_wrapper.dart';
import 'package:fire_chat/config/wrappers/common/profile_editing_bloc_wrapper.dart';
import 'package:fire_chat/config/wrappers/common/theme_bloc_wrapper.dart';
import 'package:fire_chat/domain/repositories/auth_repository/firebase_auth_repository.dart';
import 'package:fire_chat/presentation/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocsAppWrapper extends StatelessWidget {
  const BlocsAppWrapper({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AuthBlocWrapper(
      child: BlocProvider(
        create: (context) =>
            SignUpBloc(authProvider: FirebaseAuthRepository.instance),
        child: ThemeBlocWrapper(
          child: ProfileEditingBlocWrapper(
            child: child,
          ),
        ),
      ),
    );
  }
}
