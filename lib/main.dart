import 'package:first_app/ui/screens/games_screen.dart';
import 'package:first_app/viewmodels/games_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Game Deals',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xfffefdfd),
        appBarTheme: const AppBarTheme(
          color: Color(0xfffefdfd),
          elevation: 0,
          textTheme: TextTheme(
            headline1: TextStyle(
              color: Colors.black,
            )
          ),
          iconTheme: IconThemeData(
            color: Colors.black,
          )
        )
      ),
      home: MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (_) => GamesListViewModel(),
        ),
      ], child: GamesScreen()),
    );
  }
}
