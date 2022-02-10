import 'package:fire_chat/core/string_constants.dart';
import 'package:flutter/material.dart';

class EmailEditingTextField extends StatefulWidget {
  const EmailEditingTextField({
    Key? key,
    required this.initialValue,
  }) : super(key: key);

  final String? initialValue;

  @override
  _EmailEditingTextFieldState createState() => _EmailEditingTextFieldState();
}

class _EmailEditingTextFieldState extends State<EmailEditingTextField> {
  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 32,
        right: 32,
        bottom: 8,
      ),
      child: TextField(
        readOnly: true,
        controller: _emailController,
        decoration: const InputDecoration(
          labelText: AppLocalization.email,
          hintText: AppLocalization.email,
        ),
      ),
    );
  }
}
