import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/cell.dart';
import '../controllers/game_controller.dart';

class GridCell extends ConsumerWidget {
  final Cell cell;
  const GridCell({super.key, required this.cell});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(gameControllerProvider);

    return GestureDetector(
      onTap: () => controller.selectCell(cell),
      child: Container(
        margin: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          color: cell.matched ? Colors.grey.shade400 : Colors.blue.shade200,
          border: Border.all(color: Colors.black26),
        ),
        child: Center(
          child: Text(
            "${cell.value}",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: cell.matched ? Colors.black38 : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
