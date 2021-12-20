import 'package:flutter/material.dart';

class PostEntity {
  const PostEntity({
    this.color = Colors.red,
    this.description = '',
    this.username = 'user',
  });

  final Color color;
  final String username;
  final String description;
}
