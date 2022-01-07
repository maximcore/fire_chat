import 'dart:convert';

import 'package:fire_chat/presentation/blocs/profile_editing_bloc/profile_editing_bloc.dart';
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

  void _saveProfileChanges(BuildContext context) {
    context.read<ProfileEditingBloc>().save();
    Navigator.of(context).pop();
  }

  Future<void> _uploadImage() async {
    final _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.gallery);
    final result = await image!.readAsBytes();
    final url = base64Encode(result);
  }

  @override
  Widget build(BuildContext context) {
    return EditProfilePageView(
      saveProfileChanges: () {
        _saveProfileChanges(context);
      },
      onPressed: _uploadImage,
    );
  }
}
