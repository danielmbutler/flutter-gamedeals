import 'package:cached_network_image/cached_network_image.dart';
import 'package:first_app/screens/game_detail_screen.dart';
import 'package:first_app/viewmodels/game_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GamesList extends StatelessWidget {
  final List<GameViewModel> games;

  GamesList({required this.games});

  void _showGameDetails(context,game){
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return GameDetailScreen(game: game,);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        var game = games[index];
        var image = game.imageUrl;

        return GestureDetector(
          onTap: () {
            _showGameDetails(context, game);
          },
          child: GridTile(
              child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: image != null ? CachedNetworkImage(imageUrl: image,) : null,
            ),
            footer: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child:  Text(
                game.title,
                style: TextStyle(fontWeight: FontWeight.bold),
                maxLines: 1,
              ),
            ),
          ),
        )
        ;
      },
      itemCount: games.length,
    );
  }
}
