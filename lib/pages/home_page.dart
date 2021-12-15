import 'package:fire_chat/routing/defined_routes_export.dart';
import 'package:fire_chat/routing/routes.dart';
import 'package:fire_chat/string_constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPageIndex = 0;

  final String _feedLabel = 'Feed';
  final String _chatsLabel = 'Chats';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _isFeedPage() ? AppLocalization.feedPageTitle : AppLocalization.chatsPageTitle,
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
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.rss_feed_rounded),
            label: _feedLabel,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.chat),
            label: _chatsLabel,
          ),
        ],
      ),
    );
  }
}
