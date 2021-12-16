import 'package:fire_chat/routing/defined_routes_export.dart';
import 'package:fire_chat/routing/routes.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.loginPageRoute:
        return MaterialPageRoute<void>(builder: (_) => LoginPage());
      case AppRoutes.homePageRoute:
        return MaterialPageRoute<void>(builder: (_) => const HomePage());
      case AppRoutes.chatPageRoute:
        return MaterialPageRoute<void>(builder: (_) => const ChatPage());
      case AppRoutes.postDetailsPageRoute:
        return MaterialPageRoute<void>(builder: (_) => const PostDetailsPage());
      case AppRoutes.profilePageRoute:
        return MaterialPageRoute<void>(builder: (_) => const ProfilePage());
      default:
        return MaterialPageRoute<void>(
          builder: (_) => NotFoundPage(
            pageName: settings.name ?? '',
          ),
        );
    }
  }
}
