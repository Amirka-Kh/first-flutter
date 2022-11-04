import 'package:flutter/material.dart';
import './joke.dart';

class LikeJokeWidget extends StatefulWidget {
  const LikeJokeWidget({super.key});

  @override
  State<LikeJokeWidget> createState() => _LikeJokeWidget();
}

class _LikeJokeWidget extends State<LikeJokeWidget> {
  final bool isLiked = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      height: 50.0,
      decoration: const BoxDecoration(
        color: Color.fromARGB(180, 255, 255, 255),
        shape: BoxShape.circle,
      ),
      child: Icon(
        isLiked ? Icons.favorite : Icons.favorite_border,
        color: isLiked ? Colors.red : null,
        semanticLabel: isLiked ? 'Remove from liked' : 'Save',
      ),
    );
  }
}
