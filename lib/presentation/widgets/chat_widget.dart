import 'package:fire_chat/core/string_constants.dart';
import 'package:fire_chat/domain/entities/chat_entity/chat_entity.dart';
import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({
    Key? key,
    required this.chat,
    this.onTap,
  }) : super(key: key);

  final ChatEntity chat;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 100,
        child: Card(
          color: Theme.of(context).cardColor,
          margin: const EdgeInsets.only(top: 8, bottom: 8, left: 32, right: 32),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Icon(
                Icons.account_circle_rounded,
              ),
              Text(
                AppLocalization.tapToStartChat,
              ),
              Opacity(
                opacity: 0,
                child: Icon(
                  Icons.account_circle_rounded,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
