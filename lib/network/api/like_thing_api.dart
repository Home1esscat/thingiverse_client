import 'dart:developer';

import 'package:explore_nav_bar/constants/constants.dart';
import 'package:http/http.dart' as http;

class LikeThingApi {
  Future<void> like(String id) async {
    var responce = await http.Client().post(
        Uri.parse("https://" +
            Constants.thingiverseBaseUrl +
            '/things/' +
            id +
            '/likes'),
        headers: {'Authorization': 'Bearer f5037044dc4543075da0092c703da206'});
    log("Лайкаем" + responce.statusCode.toString());
  }

  Future<void> unLike(String id) async {
    var responce = await http.Client().delete(
        Uri.parse("https://" +
            Constants.thingiverseBaseUrl +
            '/things/' +
            id +
            '/likes'),
        headers: {'Authorization': 'Bearer f5037044dc4543075da0092c703da206'});
    log("Лайкаем" + responce.statusCode.toString());
  }
}
