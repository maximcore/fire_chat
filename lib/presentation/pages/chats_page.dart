import 'package:fire_chat/config/routing/routes.dart';
import 'package:fire_chat/presentation/views/chats_page_view.dart';
import 'package:flutter/material.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({Key? key}) : super(key: key);

  void goToChat(BuildContext context) =>
      Navigator.pushNamed(context, AppRoutes.chatPageRoute);

  @override
  Widget build(BuildContext context) {
    return ChatsPageView(
      onTap: () => goToChat(context),
    );
  }
}
