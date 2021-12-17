import 'package:dio/dio.dart';
import 'package:first_app/models/game.dart';
import 'package:first_app/utils/constants.dart';
import 'package:flutter/cupertino.dart';

class ApiService {
  var dio = new Dio();

  Future<List<Game>> searchGamesList(String gameTitle) async {
    String url = Constants.searchUrl + gameTitle;

    final response = await dio.get(url);

    if (response.statusCode == 200) {
      final result = response.data;
      debugPrint('gameslist: $result');
      return (result as Iterable).map((game) => Game.fromJson(game)).toList();
    } else {
      throw Exception("Failed to retrieve game list ");
    }
  }
}