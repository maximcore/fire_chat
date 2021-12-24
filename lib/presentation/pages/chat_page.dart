import 'package:fire_chat/core/string_constants.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppLocalization.chatPageTitle),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: ColoredBox(
              color: index.isEven ? Colors.greenAccent : Colors.blueAccent,
              child: const SizedBox(
                height: 50,
              ),
            ),
          );
        },
      ),
    );
  }
}
