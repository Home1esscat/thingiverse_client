import 'package:explore_nav_bar/ui/screen_factory/screen_factory.dart';
import 'package:flutter/material.dart';

abstract class Screens {
  static const main = '/';
}

class Navigation {
  final screenFactory = ScreenFactory();
  Map<String, WidgetBuilder> get routes => <String, WidgetBuilder>{
        Screens.main: (_) => screenFactory.makeMainTabs(),
      };

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    return null;
  }
}
