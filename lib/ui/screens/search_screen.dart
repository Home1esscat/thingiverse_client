import 'dart:developer';

import 'package:explore_nav_bar/constants/global_colors.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final myController = TextEditingController();
  String gg = "Hello";

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _searchBar());
  }

  Widget _searchBar() {
    return Container(
      padding: const EdgeInsets.only(top: 48),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: GlobalColors.gridGreyColor,
                borderRadius: BorderRadius.circular(30)),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            margin: const EdgeInsets.all(8),
            child: TextField(
              style: const TextStyle(color: GlobalColors.localColor),
              cursorColor: Colors.blue,
              controller: myController,
              decoration: InputDecoration(
                hintStyle: const TextStyle(
                    fontSize: 20.0, color: GlobalColors.localColor),
                border: InputBorder.none,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                hintText: 'Search design',
                suffixIcon: IconButton(
                  onPressed: (() => _getTextFromTextField(myController.text)),
                  icon: const Icon(
                    Icons.search_rounded,
                    color: GlobalColors.localColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _getTextFromTextField(String text) {
    log('Введенный текст : ' + text);
  }
}
