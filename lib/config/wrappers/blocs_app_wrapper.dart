import 'package:fire_chat/config/wrappers/common/auth_bloc_wrapper.dart';
import 'package:fire_chat/config/wrappers/common/create_post_bloc_wrapper.dart';
import 'package:fire_chat/config/wrappers/common/feed_navbar_bloc_wrapper.dart';
import 'package:fire_chat/config/wrappers/common/posts_bloc_wrapper.dart';
import 'package:fire_chat/config/wrappers/common/profile_editing_bloc_wrapper.dart';
import 'package:fire_chat/config/wrappers/common/theme_bloc_wrapper.dart';
import 'package:fire_chat/config/wrappers/common/user_profile_bloc_wrapper.dart';
import 'package:fire_chat/domain/repositories/auth_repository/auth_repository.dart';
import 'package:fire_chat/presentation/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class BlocsAppWrapper extends StatelessWidget {
  const BlocsAppWrapper({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final repository = GetIt.instance.get<AuthRepository>();
    return AuthBlocWrapper(
      child: BlocProvider(
        create: (context) => SignUpBloc(
          authProvider: repository,
        ),
        child: ThemeBlocWrapper(
          child: ProfileEditingBlocWrapper(
            child: UserProfileBlocWrapper(
              child: FeedNavbarBlocWrapper(
                child: PostsBlocWrapper(
                  child: CreatePostBlocWrapper(
                    child: child,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
