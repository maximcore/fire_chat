import 'package:fire_chat/core/string_constants.dart';
import 'package:fire_chat/presentation/blocs/profile_editing_bloc/profile_editing_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsernameEditingTextField extends StatefulWidget {
  const UsernameEditingTextField({Key? key, required this.initialValue})
      : super(key: key);

  final String? initialValue;

  @override
  _UsernameEditingTextFieldState createState() =>
      _UsernameEditingTextFieldState();
}

class _UsernameEditingTextFieldState extends State<UsernameEditingTextField> {
  late final TextEditingController _usernameController;

  @override
  void initState() {
    final bloc = context.read<ProfileEditingBloc>();
    super.initState();
    _usernameController = TextEditingController(text: widget.initialValue);
    _usernameController.addListener(
      () => bloc.editUsername(_usernameController.text),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
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
        controller: _usernameController,
        decoration: const InputDecoration(
          labelText: AppLocalization.username,
          hintText: AppLocalization.username,
        ),
      ),
    );
  }
}
