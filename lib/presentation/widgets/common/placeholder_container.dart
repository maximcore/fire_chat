import 'package:flutter/material.dart';

class PlaceholderContainer extends StatelessWidget {
  const PlaceholderContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      height: 16,
      width: 64,
      margin: const EdgeInsets.only(
        left: 32,
        right: 32,
      ),
    );
  }
}
