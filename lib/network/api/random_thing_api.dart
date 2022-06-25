import 'dart:convert';

import 'package:html/parser.dart';
import 'package:explore_nav_bar/constants/Constants.dart';
import 'package:http/http.dart' as http;

import '../models/images_list_model.dart';
import '../models/single_thing_model.dart';

class RandomThingApi {
  //Получаем ID рандомного предмета
  Future<String> _getRandomThingId() async {
    final responce = await http.Client()
        .get(Uri.parse('https://thingiverserandomizer.com/'));

    if (responce.statusCode == 200) {
      var document = parse(responce.body);
      var linkList = document.getElementsByClassName('nav-item navpad');
      String dirtyString = linkList[0].innerHtml.trim().substring(0, 58);

      dirtyString = dirtyString.substring(
          dirtyString.indexOf('"') + 1, dirtyString.lastIndexOf('"'));

      return dirtyString.substring(
          dirtyString.lastIndexOf(':') + 1, dirtyString.length);
    } else {
      throw Exception("Connection problem :(");
    }
  }

  //Получаем рандомный предмет
  Future<SingleThing> getRandomThing() async {
    final id = await _getRandomThingId();

    var uri = Uri.https(Constants.thingiverseBaseUrl, Constants.things + id);

    var response = await http
        .get(uri, headers: {Constants.autotization: Constants.bearerToken});

    return SingleThing.fromJson(json.decode(response.body));
  }

  //Получаем модель конкретного предмета по id
  Future<SingleThing> getSingleThing(int id) async {
    var uri = Uri.https(
        Constants.thingiverseBaseUrl, Constants.things + id.toString());

    var response = await http
        .get(uri, headers: {Constants.autotization: Constants.bearerToken});

    return SingleThing.fromJson(json.decode(response.body));
  }

  //Получаем список изображений предмета по ID предмета
  Future<List<ImagesListModel>> getImageList(String imageId) async {
    var uri = Uri.https(
        Constants.thingiverseBaseUrl, Constants.things + imageId + '+/images');

    var response = await http
        .get(uri, headers: {Constants.autotization: Constants.bearerToken});

    final json = jsonDecode(response.body) as List<dynamic>;
    return json
        .map((dynamic e) => ImagesListModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
