import 'package:fire_chat/core/string_constants.dart';
import 'package:fire_chat/presentation/blocs/profile_editing_bloc/profile_editing_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailTextField extends StatefulWidget {
  const EmailTextField({
    Key? key,
    required this.initialValue,
  }) : super(key: key);

  final String? initialValue;

  @override
  _EmailTextFieldState createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  late final TextEditingController _emailController;

  @override
  void initState() {
    final bloc = context.read<ProfileEditingBloc>();
    super.initState();
    _emailController = TextEditingController(text: widget.initialValue);
    _emailController.addListener(
      () => bloc.editEmail(_emailController.text),
    );
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
        controller: _emailController,
        decoration: const InputDecoration(
          hintText: AppLocalization.email,
        ),
      ),
    );
  }
}
