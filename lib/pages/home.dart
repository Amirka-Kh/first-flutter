import 'package:flutter/material.dart';
import 'package:flutter_demo/config/styleguide.dart';
import './widgets/joke.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  var _jokes = [
    "Anywhere Chuck Norris eats, instantly becomes a six star restaurant",
    "When Chuck Norris frowns, every human within 3 miles turns inside-out.",
    "Chuck Norris can tell time on a compass.",
    "Chuck Norris invented the Shotgun Enema.",
  ];

  var _jokeIndex = 0;
  final _favourites = <String>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FunnyMood',
          style: AppTheme.display2,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: _pushSaved,
            tooltip: 'Push favourites',
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(left: 32.0, top: 8.0),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(text: "Daily Joke"),
                    ]),
                  )),
              Expanded(
                  child: PageView(
                physics: const ClampingScrollPhysics(),
                children: [
                  for (var i = 0; i < _jokes.length; i++)
                    Joke(
                        joke: _jokes[i],
                        isLiked: _favourites.contains(_jokes[i])),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          final tiles = _favourites.map(
            (joke) {
              return ListTile(
                title: Text(
                  joke,
                ),
              );
            },
          );
          final divided = tiles.isNotEmpty
              ? ListTile.divideTiles(
                  context: context,
                  tiles: tiles,
                ).toList()
              : <Widget>[];

          return Scaffold(
            appBar: AppBar(
              title: const Text('Saved to favourites'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }
}
