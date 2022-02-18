import 'package:fire_chat/presentation/views/not_found_page_view.dart';
import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({
    Key? key,
    required this.pageName,
  }) : super(key: key);

  final String pageName;

  @override
  Widget build(BuildContext context) {
    return NotFoundPageView(
      pageName: pageName,
    );
  }
}
