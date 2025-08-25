import 'package:flutter/material.dart';

class Hud extends StatelessWidget {
  final int score;
  final int timeLeft;
  const Hud({super.key, required this.score, required this.timeLeft});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Score: $score", style: const TextStyle(fontSize: 18)),
          Text("Time: ${timeLeft}s", style: const TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
