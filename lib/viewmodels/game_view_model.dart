import 'package:first_app/models/game.dart';
import 'package:first_app/utils/constants.dart';

class GameViewModel {
  Game _game;

  GameViewModel({required Game game}) : _game = game;

  String get title {
    return _game.external ?? "not found";
  }

  String? get price {
    return _game.cheapest ?? "price not found";
  }

  String? get imageUrl {
    return _game.thumb;
  }

  String? get url {
    return _game.cheapestDealID != null ? Constants.dealUrl + (_game.cheapestDealID ?? "") : null;
  }

}