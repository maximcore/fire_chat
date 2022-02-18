import 'package:fire_chat/domain/entities/chat_entity/chat_entity.dart';
import 'package:fire_chat/presentation/widgets/chat_widget.dart';
import 'package:flutter/material.dart';

class ChatsPageView extends StatelessWidget {
  const ChatsPageView({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return ChatWidget(
          chat: ChatEntity(userId: index),
          onTap: onTap,
        );
      },
    );
  }
}
