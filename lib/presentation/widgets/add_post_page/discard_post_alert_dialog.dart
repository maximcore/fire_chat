import 'package:fire_chat/core/string_constants.dart';
import 'package:flutter/material.dart';

class DiscardPostAlertDialog extends StatelessWidget {
  const DiscardPostAlertDialog({
    Key? key,
    required this.context,
    required this.builderContext,
  }) : super(key: key);

  final BuildContext context;
  final BuildContext builderContext;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        AppLocalization.discardPost,
        style: TextStyle(),
        textAlign: TextAlign.center,
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(builderContext).pop();
              },
              child: Text(
                AppLocalization.cancelText,
                style: TextStyle(
                  color: Theme.of(context).primaryColorLight,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(builderContext).pop();
                Navigator.of(context).pop();
              },
              child: Text(
                AppLocalization.discardText,
                style: TextStyle(
                  color: Theme.of(context).errorColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
