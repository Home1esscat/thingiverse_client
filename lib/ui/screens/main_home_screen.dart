import 'dart:developer';

import 'package:explore_nav_bar/network/api/home_list_api.dart';
import 'package:explore_nav_bar/network/models/home_list_model.dart';
import 'package:explore_nav_bar/ui/screens/details_screen.dart';
import 'package:explore_nav_bar/ui/widgets/expandable_fab.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({Key? key}) : super(key: key);

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  static const _pageSize = 27;
  static const _page = 1;

  final PagingController<int, Hits> _pagingController =
      PagingController(firstPageKey: _page);

  @override
  void initState() {
    _pagingController.addPageRequestListener((_pageKey) {
      _fetchPage(_pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int _pageKey) async {
    try {
      final newItems = await HomeListApi().getTopList(_pageKey, _pageSize);
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = _pageKey + 1;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PagedGridView<int, Hits>(
        showNewPageProgressIndicatorAsGridChild: false,
        pagingController: _pagingController,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 2.0,
          mainAxisSpacing: 2.0,
        ),
        builderDelegate: PagedChildBuilderDelegate<Hits>(
          itemBuilder: (context, item, index) => InkWell(
            onTap: () => _selectItem(context, item.id!),
            child: Image.network(
              item.previewImage!,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      floatingActionButton: ExpandableFab(
        children: [
          ActionButton(
            onPressed: pressed,
            icon: const Icon(Icons.format_size),
            title: 'Popular last 7 days',
          ),
          ActionButton(
            onPressed: () => {},
            icon: const Icon(Icons.insert_photo),
            title: 'Popular last 30 days',
          ),
          ActionButton(
            onPressed: () => {},
            icon: const Icon(Icons.videocam),
            title: 'Popular all time',
          ),
        ],
      ),
    );
  }

  void pressed() {
    log("Хуй пизда");
  }

  void _selectItem(BuildContext context, int item) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (c, a1, a2) => DetailsScreen(currentThing: item),
        transitionsBuilder: (c, anim, a2, child) =>
            FadeTransition(opacity: anim, child: child),
        transitionDuration: const Duration(milliseconds: 200),
      ),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
