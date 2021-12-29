import 'package:fire_chat/core/string_constants.dart';
import 'package:flutter/material.dart';

class PostDetailsPage extends StatelessWidget {
  const PostDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppLocalization.postDetailsPageTitle),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.all(8),
          );
        },
      ),
    );
  }
}
