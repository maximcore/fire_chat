import 'package:fire_chat/presentation/blocs/feed_navbar_bloc/feed_navbar_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedNavbarBlocWrapper extends StatelessWidget {
  const FeedNavbarBlocWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FeedNavbarBloc>(
      create: (_) => FeedNavbarBloc(),
      child: child,
    );
  }
}
