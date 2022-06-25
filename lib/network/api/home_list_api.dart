import 'dart:convert';
import 'dart:developer';

import 'package:explore_nav_bar/constants/Constants.dart';
import 'package:explore_nav_bar/network/models/home_list_model.dart';
import 'package:http/http.dart' as http;

class HomeListApi {
  Future<List<Hits>> getTopList(int page, int size) async {
    log('Page ' + page.toString() + 'Size ' + size.toString());
    List<Hits> dataList = [];
    var params = {
      'sort': 'popular',
      'page': page.toString(),
      'per_page': size.toString(),
    };

    var uri = Uri.https(Constants.thingiverseBaseUrl, Constants.search, params);

    var request = await http
        .get(uri, headers: {Constants.autotization: Constants.bearerToken});

    HomeListModel model = HomeListModel.fromJson(json.decode(request.body));

    dataList.insertAll(0, model.hits!);

    return dataList;
  }
}
