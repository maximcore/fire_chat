import 'package:fire_chat/routing/routes.dart';
import 'package:flutter/material.dart';

//ignore: must_be_immutable
class Post extends StatelessWidget {
  Post({
    Key? key,
    this.color = Colors.red,
    this.description = '',
    this.username = 'user',
    this.onDoubleTap,
  }) : super(key: key);

  Color color;
  final String username;
  final String description;
  void Function(BuildContext context)? onDoubleTap;

  void _onTap(BuildContext context) =>
      Navigator.pushNamed(context, AppRoutes.postDetailsPageRoute);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTap(context),
      onDoubleTap: () => onDoubleTap!(context),
      child: Container(
        margin: const EdgeInsets.only(top: 8, bottom: 8, left: 32, right: 32),
        color: color,
        height: 160,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.account_circle_rounded),
                Text(
                  username,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(
              description,
              textAlign: TextAlign.center,
            ),
            const Text(
              'Tap to see post details',
            ),
          ],
        ),
      ),
    );
  }
}
