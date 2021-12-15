import 'package:fire_chat/widgets/models/post.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: constraints.maxHeight,
          ),
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return Post(
                description: '$index',
              );
            },
          ),
        );
      },
    );
  }
}
