import 'dart:convert';
import 'dart:developer';

import 'package:explore_nav_bar/constants/constants.dart';
import 'package:http/http.dart' as http;

import '../models/favorite_things_list_model.dart';

class FavoriteThingsCatalogApi {
  Future<List<FavoriteThingsCatalog>> getfavoriteThings() async {
    var uri = Uri.https(Constants.thingiverseBaseUrl,
        Constants.usersHomelesscat + Constants.likes);

    var request = await http
        .get(uri, headers: {Constants.autotization: Constants.bearerToken});

    log('status code: ${request.statusCode}');

    final json = jsonDecode(request.body) as List<dynamic>;
    return json
        .map((dynamic e) =>
            FavoriteThingsCatalog.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
