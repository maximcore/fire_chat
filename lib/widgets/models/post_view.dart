import 'package:flutter/material.dart';

class PostView {
  const PostView({
    this.color = Colors.red,
    this.description = '',
    this.username = 'user',
  });

  final Color color;
  final String username;
  final String description;
}
