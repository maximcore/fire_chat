import 'package:fire_chat/core/string_constants.dart';
import 'package:flutter/material.dart';

class ChatPageView extends StatelessWidget {
  const ChatPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppLocalization.chatPageTitle),
        centerTitle: true,
      ),
      body: ListView(),
    );
  }
}
