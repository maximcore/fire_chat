import 'package:fire_chat/core/string_constants.dart';
import 'package:fire_chat/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:fire_chat/presentation/blocs/user_profile_bloc/user_profile_bloc.dart';
import 'package:fire_chat/presentation/blocs/user_profile_bloc/user_profile_bloc_state.dart';
import 'package:fire_chat/presentation/widgets/profile_page/profile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersProfilePageView extends StatelessWidget {
  const UsersProfilePageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthBloc>().state.user;
    return BlocBuilder<UserProfileBloc, UserProfileBlocState>(
      builder: (context, state) {
        late final bool isOwnProfile;
        if (state.user!.id == user!.id) {
          isOwnProfile = true;
        } else {
          isOwnProfile = false;
        }
        switch (state.status) {
          case UserProfileBlocStatus.initial:
            return Scaffold(
              body: SafeArea(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        AppLocalization.initializing,
                      ),
                      CircularProgressIndicator(),
                    ],
                  ),
                ),
              ),
            );
          case UserProfileBlocStatus.ready:
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text(state.user!.username),
              ),
              body: SafeArea(
                child: ProfileCard(
                  isOwnProfile: isOwnProfile,
                  //TODO(Maxim): handle null user
                  user: state.user!,
                ),
              ),
            );
          case UserProfileBlocStatus.updating:
            return Scaffold(
              body: SafeArea(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        AppLocalization.loading,
                      ),
                      CircularProgressIndicator(),
                    ],
                  ),
                ),
              ),
            );
          case UserProfileBlocStatus.error:
            return Scaffold(
              body: SafeArea(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        AppLocalization.error,
                      ),
                      CircularProgressIndicator(),
                    ],
                  ),
                ),
              ),
            );
        }
      },
    );
  }
}
