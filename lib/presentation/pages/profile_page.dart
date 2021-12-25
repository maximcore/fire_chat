import 'package:fire_chat/core/string_constants.dart';
import 'package:fire_chat/presentation/blocs/theme_bloc/theme_bloc.dart';
import 'package:fire_chat/presentation/blocs/theme_bloc/theme_bloc_state.dart';
import 'package:fire_chat/presentation/blocs/theme_bloc/theme_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  Widget _placeholderContainer(BuildContext context) {
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

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<ThemeBloc>(context);
    return BlocBuilder<ThemeBloc, ThemeBlocState>(
        bloc: bloc,
        builder: (_, state) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () {
                    context.read<ThemeBloc>().add(
                          ChangeThemeEvent(),
                        );
                  },
                  icon: state.status == ThemeBlocStatus.light
                      ? const FaIcon(
                          FontAwesomeIcons.moon,
                        )
                      : const FaIcon(
                          FontAwesomeIcons.sun,
                        ),
                ),
              ],
              title: const Text(AppLocalization.profilePageTitle),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Card(
                    margin: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Icon(
                          Icons.person_pin,
                          size: 128,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text(
                          AppLocalization.username,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        _placeholderContainer(context),
                        const SizedBox(
                          height: 16,
                        ),
                        _placeholderContainer(context),
                        const SizedBox(
                          height: 16,
                        ),
                        _placeholderContainer(context),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
