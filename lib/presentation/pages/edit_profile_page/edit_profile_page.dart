import 'package:fire_chat/presentation/pages/edit_profile_page/edit_profile_page_view.dart';
import 'package:flutter/material.dart';

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

  // void showSnackBar(BuildContext context) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     const SnackBar(
  //       content: ProfileSnackBar(),
  //     ),
  //   );
  //   Navigator.of(context).pop();
  // }

  @override
  Widget build(BuildContext context) {
    return EditProfilePageView(
      showSnackBar: () {},
    );
  }
}
