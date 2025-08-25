import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/game_controller.dart';
import '../widgets/grid_cell.dart';
import '../widgets/hud.dart';

class GameScreen extends ConsumerStatefulWidget {
  final int level;
  const GameScreen({super.key, required this.level});

  @override
  ConsumerState<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends ConsumerState<GameScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    final controller = ref.read(gameControllerProvider);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!controller.paused && controller.timeLeft > 0) {
        controller.timeLeft--;
        controller.notifyListeners();
      } else if (controller.timeLeft <= 0) {
        timer.cancel();
        _showGameOver("Time's Up!");
      }
    });
  }

  void _showGameOver(String msg) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(msg),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text("Back"))
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(gameControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Level ${widget.level}"),
        actions: [
          IconButton(
              onPressed: controller.pauseGame, icon: const Icon(Icons.pause))
        ],
      ),
      body: Column(
        children: [
          Hud(score: controller.score, timeLeft: controller.timeLeft),
          Expanded(
            child: GridView.builder(
              itemCount: controller.rows * controller.cols,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: controller.cols),
              itemBuilder: (_, index) {
                int r = index ~/ controller.cols;
                int c = index % controller.cols;
                final cell = controller.grid[r][c];
                if (cell == null) return const SizedBox.shrink();
                return GridCell(cell: cell);
              },
            ),
          ),
          ElevatedButton(
            onPressed: controller.addRow,
            child: const Text("Add Row"),
          )
        ],
      ),
    );
  }
}
