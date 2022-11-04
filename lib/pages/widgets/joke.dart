import 'package:flutter/material.dart';
import './like_joke_button.dart';
import '../../config/styleguide.dart';

class Joke extends StatelessWidget {
  final String joke;
  final bool isLiked;

  Joke({required this.joke, required this.isLiked});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            height: 0.5 * screenHeight,
            width: 0.9 * screenWidth,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(20)),
              gradient: LinearGradient(
                colors: [Colors.red, Colors.orange.shade900],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
            child: Stack(children: [
              Align(
                alignment: const Alignment(0.9, 0.9),
                child: LikeJokeWidget(),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Material(
                      color: Colors.transparent,
                      child: Container(
                        child: Text(
                          joke,
                          style: AppTheme.display1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
