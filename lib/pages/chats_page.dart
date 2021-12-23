import 'package:fire_chat/routing/routes.dart';
import 'package:fire_chat/widgets/chat_widget.dart';
import 'package:fire_chat/widgets/entities/chat_entity/chat_entity.dart';
import 'package:flutter/material.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({Key? key}) : super(key: key);

  void _goToChat(BuildContext context) =>
      Navigator.pushNamed(context, AppRoutes.chatPageRoute);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return ChatWidget(
          chat: ChatEntity(userId: index),
          onTap: () {
            _goToChat(context);
          },
        );
      },
    );
  }
}
