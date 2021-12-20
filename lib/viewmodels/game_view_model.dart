import 'package:first_app/models/game.dart';
import 'package:first_app/utils/constants.dart';

class GameViewModel {

  Game game;

  GameViewModel({required Game gameObj}) : game = gameObj;

  String get title {
    return game.external ?? "not found";
  }

  String get gameId {
    return game.gameId ?? "not found";
  }

  String? get price {
    return game.cheapest ?? "price not found";
  }

  String? get imageUrl {
    return game.thumb;
  }

  String? get url {
    return game.cheapestDealID != null ? Constants.dealUrl + (game.cheapestDealID ?? "") : null;
  }

  bool get saved {
    return game.saved;
  }

  void setSaved() {
    game.saved = true;
  }

}