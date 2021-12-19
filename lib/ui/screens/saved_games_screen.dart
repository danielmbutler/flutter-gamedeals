import 'package:first_app/ui/widgets/games_list.dart';
import 'package:first_app/viewmodels/game_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SavedGamesScreen extends StatelessWidget {
  final List<GameViewModel> gamesList;

  SavedGamesScreen(this.gamesList);

  Widget _buildList() {
    if (gamesList.isEmpty) {
      return const Center(
        child: Text('Your saved deals will appear here'),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: GamesList(
          games: gamesList,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your saved deals'),
        backgroundColor: Colors.lightBlue[300],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Padding(
              padding:
                  EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
            ),
            Expanded(child: _buildList()),
          ],
        ),
      ),
    );
  }
}
