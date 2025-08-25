import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/level_selection.dart';

void main() {
  runApp(const ProviderScope(child: NumberPuzzleApp()));
}

class NumberPuzzleApp extends StatelessWidget {
  const NumberPuzzleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Number Puzzle',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      home: const LevelSelectionScreen(),
    );
  }
}
