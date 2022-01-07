import 'package:fire_chat/core/string_constants.dart';
import 'package:fire_chat/presentation/blocs/profile_editing_bloc/profile_editing_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsernameTextFormField extends StatefulWidget {
  const UsernameTextFormField({Key? key, required this.initialValue})
      : super(key: key);

  final String? initialValue;

  @override
  _UsernameTextFormFieldState createState() => _UsernameTextFormFieldState();
}

class _UsernameTextFormFieldState extends State<UsernameTextFormField> {
  late final TextEditingController _usernameController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProfileEditingBloc>();

    return Padding(
      padding: const EdgeInsets.only(
        left: 32,
        right: 32,
        bottom: 8,
      ),
      child: TextField(
        onSubmitted: bloc.updateUserWithUsername,
        controller: _usernameController,
        decoration: const InputDecoration(
          hintText: AppLocalization.username,
        ),
      ),
    );
  }
}
