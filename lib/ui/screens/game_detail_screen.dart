import 'package:cached_network_image/cached_network_image.dart';
import 'package:first_app/utils/constants.dart';
import 'package:first_app/viewmodels/game_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';

class GameDetailScreen extends StatelessWidget {
  final GameViewModel game;

  GameDetailScreen({required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[300],
        title: Text(
          game.title.toString() + " info",
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body:  SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
            ),
            Expanded(
                child:  _buildDetailScreen(game)
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildDetailScreen(GameViewModel game){
    return Column(
      children: [
        CachedNetworkImage(
            imageUrl: game.imageUrl ?? Constants.default_game_img,
            fit: BoxFit.fill,
            height: 200,
            width: 300,
        ),
        const Padding(padding: EdgeInsets.only(top: 6)),
        Text(
            "Price : \$ ${game.price}",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
        ),
        const Padding(padding: EdgeInsets.only(top: 20)),
        ElevatedButton(
          style:  ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
          onPressed: () {
            openBrowserTab();
          },
          child: Text('GET DEAL'),
        ),
        const Padding(padding: EdgeInsets.only(top: 20)),
        ElevatedButton(
          style:  ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.grey)),
          onPressed: () {
            // Respond to button press
          },
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text('Add to favourites'),
              Icon(Icons.favorite),
            ],
          ),
        )

      ],
    );
  }

  openBrowserTab() async {
      debugPrint("pressed");
      await FlutterWebBrowser.openWebPage(url: game.url!);
  }
}
