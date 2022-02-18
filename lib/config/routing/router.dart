import 'package:fire_chat/config/routing/defined_routes_export.dart';
import 'package:fire_chat/config/routing/routes.dart';
import 'package:fire_chat/presentation/pages/edit_profile_page.dart';
import 'package:fire_chat/presentation/pages/sign_up_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case EditProfilePage.routeName:
        return EditProfilePage.route(settings);
      case AppRoutes.loginPageRoute:
        return MaterialPageRoute<void>(builder: (_) => const SignInPage());
      case AppRoutes.signUpPageRoute:
        return MaterialPageRoute<void>(builder: (_) => const SignUpPage());
      case AppRoutes.homePageRoute:
        return MaterialPageRoute<void>(builder: (_) => const HomePage());
      case AppRoutes.chatPageRoute:
        return MaterialPageRoute<void>(builder: (_) => const ChatPage());
      case AppRoutes.postDetailsPageRoute:
        return MaterialPageRoute<void>(builder: (_) => const PostDetailsPage());
      case AppRoutes.profilePageRoute:
        return MaterialPageRoute<void>(builder: (_) => const ProfilePage());
      case AppRoutes.addPostPage:
        return MaterialPageRoute<void>(builder: (_) => const AddPostPage());
      default:
        return MaterialPageRoute<void>(
          builder: (_) => NotFoundPage(
            pageName: settings.name ?? '',
          ),
        );
    }
  }
}
