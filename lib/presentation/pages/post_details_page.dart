import 'package:fire_chat/core/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostDetailsPage extends StatelessWidget {
  const PostDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppLocalization.postDetailsPageTitle),
        centerTitle: true,
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
