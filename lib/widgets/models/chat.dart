import 'package:fire_chat/routing/routes.dart';
import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  const Chat({
    Key? key,
    required this.userId,
  }) : super(key: key);

  final int userId;

  void _onTap(BuildContext context) => Navigator.pushNamed(
        context,
        AppRoutes.chatPageRoute,
      );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTap(context),
      child: Container(
        margin: const EdgeInsets.only(top: 8, bottom: 8, left: 32, right: 32),
        color: Colors.grey,
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              Icons.account_circle_rounded,
            ),
            Text(
              'Tap to start chat with $userId user',
            ),
            const Opacity(
              opacity: 0,
              child: Icon(
                Icons.account_circle_rounded,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
