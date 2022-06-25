import 'package:explore_nav_bar/ui/themes/app_theme.dart';
import 'package:flutter/material.dart';

import '../navigation/main_navigation.dart';

class MyApp extends StatelessWidget {
  final navigation = Navigation();
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routes: navigation.routes,
      onGenerateRoute: navigation.onGenerateRoute,
    );
  }
}
