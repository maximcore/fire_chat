import 'package:fire_chat/core/string_constants.dart';
import 'package:fire_chat/presentation/blocs/posts_bloc/posts_bloc.dart';
import 'package:fire_chat/presentation/blocs/posts_bloc/posts_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ErrorBanner extends StatelessWidget {
  const ErrorBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          AppLocalization.tryAgainText,
          textAlign: TextAlign.center,
        ),
        Column(
          children: [
            IconButton(
              onPressed: () {
                context.read<PostsBloc>().add(FetchingDataEvent());
              },
              icon: const Icon(Icons.refresh),
            ),
          ],
        )
      ],
    );
  }
}
