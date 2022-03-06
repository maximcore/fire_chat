import 'package:fire_chat/core/string_constants.dart';
import 'package:fire_chat/presentation/blocs/create_post_bloc/create_post_bloc.dart';
import 'package:fire_chat/presentation/blocs/create_post_bloc/create_post_bloc_state.dart';
import 'package:fire_chat/presentation/pages/feed_page.dart';
import 'package:fire_chat/presentation/widgets/common/flavors_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({
    Key? key,
    required this.fetchPosts,
    required this.goToChats,
    required this.goToProfile,
    required this.goToAddPostPage,
    required this.onFilterPressed,
  }) : super(key: key);

  final Function() fetchPosts;
  final VoidCallback goToChats;
  final VoidCallback goToProfile;
  final VoidCallback goToAddPostPage;
  final VoidCallback onFilterPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: IconButton(
                  icon: const Icon(FontAwesomeIcons.user),
                  onPressed: fetchPosts,
                ),
                label: AppLocalization.allPosts,
              ),
              BottomNavigationBarItem(
                icon: IconButton(
                  icon: const Icon(FontAwesomeIcons.userFriends),
                  onPressed: onFilterPressed,
                ),
                label: AppLocalization.following,
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: goToAddPostPage,
            child: const Icon(Icons.add),
          ),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text(AppLocalization.feedPageTitle),
            actions: [
              // IconButton(
              //   icon: const FaIcon(FontAwesomeIcons.filter),
              //   onPressed: onFilterPressed,
              // ),
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.facebookMessenger),
                onPressed: goToChats,
              ),
              IconButton(
                icon: const Icon(Icons.account_circle_rounded),
                onPressed: goToProfile,
              ),
            ],
            centerTitle: true,
          ),
          body: BlocConsumer<CreatePostBloc, CreatePostBlocState>(
            listener: (context, state) {
              if (state.status == CreatePostBlocStatus.ready) {
                fetchPosts();
              }
            },
            builder: (context, state) {
              return const FeedPage();
            },
          ),
        ),
        const FlavorsBanner(),
      ],
    );
  }
}
