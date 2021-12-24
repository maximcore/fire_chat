import 'package:fire_chat/core/string_constants.dart';
import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key, required this.pageName}) : super(key: key);

  final String pageName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppLocalization.notFoundPageTitle),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(AppLocalization.pageNotFoundText),
      ),
    );
  }
}
