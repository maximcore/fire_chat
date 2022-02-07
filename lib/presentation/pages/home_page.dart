import 'package:fire_chat/config/routing/routes.dart';
import 'package:fire_chat/core/string_constants.dart';
import 'package:fire_chat/presentation/pages/chats_page.dart';
import 'package:fire_chat/presentation/pages/feed_page.dart';
import 'package:fire_chat/presentation/widgets/common/flavors_banner.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPageIndex = 0;

  final List<Widget> _pages = [
    const FeedPage(),
    const ChatsPage(),
  ];

  void _onNavbarItemTap(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  bool _isFeedPage() => _currentPageIndex == 0 ? true : false;

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
            title: Text(
              _isFeedPage()
                  ? AppLocalization.feedPageTitle
                  : AppLocalization.chatsPageTitle,
            ),
            actions: [
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
          body: _pages[_currentPageIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentPageIndex,
            onTap: _onNavbarItemTap,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.rss_feed_rounded),
                label: AppLocalization.feedLabel,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: AppLocalization.chatsLabel,
              ),
            ],
          ),
        ),
        const FlavorsBanner(),
      ],
    );
  }
}
