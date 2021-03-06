import 'package:fire_chat/config/image_uploader.dart';
import 'package:fire_chat/config/routing/routes.dart';
import 'package:fire_chat/core/string_constants.dart';
import 'package:fire_chat/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:fire_chat/presentation/blocs/profile_editing_bloc/profile_editing_bloc.dart';
import 'package:fire_chat/presentation/views/edit_profile_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  static const String routeName = '/edit_profile';

  static MaterialPageRoute<void> route(
    RouteSettings settings,
  ) {
    return MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return const EditProfilePage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthBloc>();
    final profileEditingBloc = context.read<ProfileEditingBloc>();
    return EditProfilePageView(
      saveProfileChanges: () {
        _saveProfileChanges(context);
      },
      onPressed: () async {
        final url = await ImageUploader.uploadImage(context);
        if (url != null) {
          profileEditingBloc.editAvatar(url);
        }
      },
      onDeleteProfilePressed: () {
        _showDeleteProfileDialog(context, authBloc);
        context.read<AuthBloc>().delete();
      },
    );
  }

  void _saveProfileChanges(BuildContext context) {
    context.read<ProfileEditingBloc>().save();
    Navigator.of(context).pop();
  }

  void _showDeleteProfileDialog(
    BuildContext context,
    AuthBloc bloc,
  ) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(AppLocalization.deleteProfileTitle),
          actions: [
            TextButton(
              child: const Text(AppLocalization.delete),
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  AppRoutes.loginPageRoute,
                  (route) => true,
                );
                //bloc.delete();
              },
            ),
            TextButton(
              child: const Text(AppLocalization.cancel),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
