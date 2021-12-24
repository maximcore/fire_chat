import 'package:fire_chat/config/routing/routes.dart';
import 'package:fire_chat/core/string_constants.dart';
import 'package:fire_chat/domain/repositories/posts_repository.dart';
import 'package:fire_chat/presentation/blocs/posts_bloc/posts_bloc.dart';
import 'package:fire_chat/presentation/blocs/posts_bloc/posts_events.dart';
import 'package:fire_chat/presentation/pages/chats_page.dart';
import 'package:fire_chat/presentation/pages/feed_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

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
    final repository = GetIt.instance.get<PostsRepository>();
    return Scaffold(
      appBar: AppBar(
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
      body: BlocProvider<PostsBloc>(
        create: (_) => PostsBloc(repository: repository)
          ..add(
            FetchingDataEvent(),
          ),
        child: _pages[_currentPageIndex],
      ),
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
