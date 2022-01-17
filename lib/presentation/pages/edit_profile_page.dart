import 'dart:convert';

import 'package:fire_chat/config/routing/routes.dart';
import 'package:fire_chat/core/string_constants.dart';
import 'package:fire_chat/presentation/blocs/profile_editing_bloc/profile_editing_bloc.dart';
import 'package:fire_chat/presentation/blocs/profile_existence_bloc/profile_existence_bloc.dart';
import 'package:fire_chat/presentation/views/edit_profile_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

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
    final bloc = context.read<ProfileExistenceBloc>();
    return EditProfilePageView(
      saveProfileChanges: () {
        _saveProfileChanges(context);
      },
      onPressed: _uploadImage,
      onDeleteProfilePressed: () {
        _showDeleteProfileDialog(context, bloc);
      },
    );
  }

  void _saveProfileChanges(BuildContext context) {
    context.read<ProfileEditingBloc>().saveUser();
    Navigator.of(context).pop();
  }

  Future<void> _uploadImage() async {
    final _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.gallery);
    final result = await image!.readAsBytes();
    final url = base64Encode(result);
  }

  void _showDeleteProfileDialog(
    BuildContext context,
    ProfileExistenceBloc bloc,
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
                bloc.delete();
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
