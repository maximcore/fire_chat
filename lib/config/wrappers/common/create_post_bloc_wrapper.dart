import 'package:fire_chat/presentation/blocs/create_post_bloc/create_post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatePostBlocWrapper extends StatelessWidget {
  const CreatePostBlocWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreatePostBloc>(
      create: (_) => CreatePostBloc(),
      child: child,
    );
  }
}
