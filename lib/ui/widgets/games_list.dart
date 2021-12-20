import 'package:cached_network_image/cached_network_image.dart';
import 'package:first_app/services/database_handler.dart';
import 'package:first_app/ui/screens/game_detail_screen.dart';
import 'package:first_app/utils/constants.dart';
import 'package:first_app/viewmodels/game_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class GamesList extends StatefulWidget {
  final List<GameViewModel> games;
  final DatabaseHandler _databaseHandler = DatabaseHandler.getInstance();
  final bool isSavedList;

  GamesList({required this.games, required this.isSavedList});

  @override
  _GameListState createState() =>
      _GameListState(games, _databaseHandler, isSavedList);
}

class _GameListState extends State<GamesList> {
  final List<GameViewModel> games;
  final DatabaseHandler _databaseHandler;
  final bool isSavedList;

  _GameListState(this.games, this._databaseHandler, this.isSavedList);

  Future<void> _showGameDetails(context, GameViewModel game) async {
    bool isSaved = await _databaseHandler.isGameSaved(game.gameId);

    if (isSaved) game.setSaved();

    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return GameDetailScreen(game: game);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: games.length,
        itemBuilder: (context, index) {
          var game = games[index];
          var image = game.imageUrl ?? Constants.default_game_img;

          return Card(
            child: ListTile(
              leading: CachedNetworkImage(
                imageUrl: image,
                height: 50,
                width: 50,
              ),
              title: Text(game.title),
              subtitle: Text('\$' + game.price.toString()),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                _showGameDetails(context, game);
              },
              onLongPress: () {
                if (isSavedList) {
                  Alert(
                    context: context,
                    type: AlertType.info,
                    title: "Delete deal",
                    desc: "Do you want to delete this deal ?",
                    buttons: [
                      DialogButton(
                        child: Text(
                          "Yes",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () => deleteDeal(game, context),
                        width: 120,
                      )
                    ],
                  ).show();
                }
              },
            ),
          );
        });
  }

  deleteDeal(GameViewModel game, BuildContext context) {
    _databaseHandler.deleteGame(game.gameId).whenComplete(() => {
      games.remove(game),
      setState(() {}),
      Navigator.pop(context)
    });
  }
}
