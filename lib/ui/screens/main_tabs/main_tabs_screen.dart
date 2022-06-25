import 'package:explore_nav_bar/ui/screens/categories_screen.dart';
import 'package:explore_nav_bar/ui/screens/favorite_screen.dart';
import 'package:explore_nav_bar/ui/screens/main_tabs/main_tabs_view_model.dart';
import 'package:explore_nav_bar/ui/screens/random_screen.dart';
import 'package:explore_nav_bar/ui/screens/main_home_screen.dart';
import 'package:explore_nav_bar/ui/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../test.dart';

class MainTabsScreen extends StatelessWidget {
  const MainTabsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _BodyWidget(),
      bottomNavigationBar: _NavBarWidget(),
    );
  }
}

class _BodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentIndex =
        context.select((MainTabsViewModel vm) => vm.currentTabIndex);
    return IndexedStack(
      index: currentIndex,
      children: const [
        MainHomeScreen(),
        Categories(),
        SearchScreen(),
        FavoriteScreen(),
        RandomScreen(),
      ],
    );
  }
}

class _NavBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentIndex =
        context.select((MainTabsViewModel vm) => vm.currentTabIndex);

    final model = context.read<MainTabsViewModel>();

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      iconSize: 28,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: model.setCurrentTabIndex,
      currentIndex: currentIndex,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.category_rounded), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.search_rounded), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_rounded), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.shuffle_rounded), label: ''),
      ],
    );
  }
}
