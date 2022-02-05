import 'package:fire_chat/core/string_constants.dart';
import 'package:fire_chat/presentation/blocs/profile_editing_bloc/profile_editing_bloc.dart';
import 'package:fire_chat/presentation/blocs/profile_editing_bloc/profile_editing_bloc_state.dart';
import 'package:fire_chat/presentation/widgets/edit_profile_page/profile_error_widget.dart';
import 'package:fire_chat/presentation/widgets/edit_profile_page/profile_initializing_widget.dart';
import 'package:fire_chat/presentation/widgets/edit_profile_page/profile_ready_widget.dart';
import 'package:fire_chat/presentation/widgets/edit_profile_page/profile_updating_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditProfilePageView extends StatelessWidget {
  const EditProfilePageView({
    Key? key,
    required this.saveProfileChanges,
    required this.onPressed,
    required this.onDeleteProfilePressed,
  }) : super(key: key);

  final VoidCallback saveProfileChanges;
  final VoidCallback onPressed;
  final VoidCallback onDeleteProfilePressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.read<ProfileEditingBloc>().cancel();
            },
            icon: const Icon(
              Icons.cancel_outlined,
            ),
          ),
          IconButton(
            onPressed: saveProfileChanges,
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
      body: BlocBuilder<ProfileEditingBloc, ProfileEditingBlocState>(
        builder: (context, state) {
          switch (state.status) {
            case ProfileEditingBlocStatus.initial:
              return const ProfileInitializingWidget();
            case ProfileEditingBlocStatus.ready:
              return ProfileReadyWidget(
                state: state,
                onPressed: onPressed,
                onDeleteProfilePressed: onDeleteProfilePressed,
              );
            case ProfileEditingBlocStatus.updating:
              return const ProfileUpdatingWidget();
            case ProfileEditingBlocStatus.error:
              return const ProfileErrorWidget();
          }
        },
      ),
    );
  }
}
