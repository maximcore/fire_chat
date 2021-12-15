import 'package:fire_chat/routing/routes.dart';
import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  const Post({
    Key? key,
    this.description = '',
    this.title = 'Post',
  }) : super(key: key);

  final String title;
  final String description;

  void _onTap(BuildContext context) => Navigator.pushNamed(
        context,
        AppRoutes.postDetailsPageRoute,
      );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTap(context),
      child: Container(
        margin: const EdgeInsets.only(top: 8, bottom: 8, left: 32, right: 32),
        color: Colors.grey,
        height: 160,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.account_circle_rounded),
            Text(
              '$title $description',
            ),
            const Text(
              'Tap to see post details',
            )
          ],
        ),
      ),
    );
  }
}
