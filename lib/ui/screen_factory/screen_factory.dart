import 'package:explore_nav_bar/ui/screens/main_tabs/main_tabs_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/main_tabs/main_tabs_view_model.dart';

class ScreenFactory {
  Widget makeMainTabs() => ChangeNotifierProvider(
        create: (_) => MainTabsViewModel(),
        child: const MainTabsScreen(),
      );
}
