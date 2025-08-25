import 'package:flutter/material.dart';
import 'game_screen.dart';

class LevelSelectionScreen extends StatelessWidget {
  const LevelSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Level")),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Level 1"),
            subtitle: const Text("Easy - 2 minutes"),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => GameScreen(level: 1))),
          ),
          ListTile(
            title: const Text("Level 2"),
            subtitle: const Text("Medium - Harder grid"),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => GameScreen(level: 2))),
          ),
          ListTile(
            title: const Text("Level 3"),
            subtitle: const Text("Hard - Limited add rows"),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => GameScreen(level: 3))),
          ),
        ],
      ),
    );
  }
}
