import 'package:fire_chat/config/routing/routes.dart';
import 'package:fire_chat/core/string_constants.dart';
import 'package:fire_chat/presentation/pages/feed_page.dart';
import 'package:fire_chat/presentation/widgets/common/flavors_banner.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.addPostPage,
              );
            },
            child: const Icon(Icons.add),
          ),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text(AppLocalization.feedPageTitle),
            actions: [
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.facebookMessenger),
                onPressed: () => Navigator.pushNamed(
                  context,
                  AppRoutes.chatPageRoute,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.account_circle_rounded),
                onPressed: () => Navigator.pushNamed(
                  context,
                  AppRoutes.profilePageRoute,
                ),
              ),
            ],
            centerTitle: true,
          ),
          body: const FeedPage(),
        ),
        const FlavorsBanner(),
      ],
    );
  }
}
