import 'package:first_app/ui/widgets/search_bar.dart';
import 'package:first_app/viewmodels/games_list_view_model.dart';
import 'package:first_app/ui/widgets/games_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GamesScreen extends StatefulWidget {
  @override
  _GamesScreenState createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {


  void searchGames( String searchString) {
    Provider.of<GamesListViewModel>(context, listen: false)
        .searchGamesByTitle(searchString);
  }

  Widget _buildList(GamesListViewModel vs) {
    switch (vs.loadingStatus) {
      case LoadingStatus.searching:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case LoadingStatus.completed:
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: GamesList(
            games: vs.games,
          ),
        );
      case LoadingStatus.empty:
      default:
        return const Center(
          child: Text("No results found"),
        );
    }
  }



  @override
  Widget build(BuildContext context) {
    var vs = Provider.of<GamesListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Game Deals'),
        backgroundColor: Colors.lightBlue[300],
        actions: <Widget>[navigateToSavedDealsBtn()],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
            ),
            SizedBox(
              width: 100,
              height: 80,
              child: SearchBar(searchGames)
            ),
            Expanded(
                child:  _buildList(vs)
            ),
          ],
        ),
      ),
    );
  }


  Widget navigateToSavedDealsBtn() {
    return IconButton(
      icon: const Icon(Icons.favorite_rounded),
      tooltip: 'Go to the next page',
      onPressed: () {
        Navigator.push(context, MaterialPageRoute<void>(
          builder: (BuildContext context) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Your saved deals'),
                backgroundColor: Colors.lightBlue[300],
              ),
              body: const Center(
                child: Text(
                  'Your saved deals',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            );
          },
        ));
      },
    );
  }
}
