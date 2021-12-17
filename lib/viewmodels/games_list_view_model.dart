import 'package:first_app/models/game.dart';
import 'package:first_app/api/game_api.dart';
import 'package:first_app/viewmodels/game_view_model.dart';
import 'package:flutter/cupertino.dart';

enum LoadingStatus {
  completed,
  searching,
  empty
}

class GamesListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.empty;
  List<GameViewModel> games = <GameViewModel>[];


  void searchGamesByTitle(String gameTitle) async {

    this.loadingStatus = LoadingStatus.searching;
    notifyListeners();

    List<Game> games =
    await ApiService().searchGamesList(gameTitle);

    this.games = games
        .map((game) => GameViewModel(game: game))
        .toList();

    if (this.games.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.completed;
    }

    notifyListeners();

  }

}