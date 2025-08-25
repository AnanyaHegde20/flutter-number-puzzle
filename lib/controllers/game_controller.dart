import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/cell.dart';

final gameControllerProvider =
    ChangeNotifierProvider<GameController>((ref) => GameController());

class GameController extends ChangeNotifier {
  late List<List<Cell?>> grid;
  final int rows = 9;
  final int cols = 9;

  Cell? firstSelected;
  int score = 0;
  int level = 1;
  int timeLeft = 120; // seconds per level
  bool paused = false;

  GameController() {
    _initGrid();
  }

  void _initGrid() {
    grid = List.generate(rows, (r) {
      return List.generate(cols, (c) {
        if (r < 4) {
          return Cell(row: r, col: c, value: Random().nextInt(9) + 1);
        }
        return null;
      });
    });
    score = 0;
    timeLeft = 120;
    firstSelected = null;
  }

  void selectCell(Cell cell) {
    if (cell.matched) return;

    if (firstSelected == null) {
      firstSelected = cell;
      notifyListeners();
    } else {
      _checkMatch(firstSelected!, cell);
      firstSelected = null;
    }
  }

  void _checkMatch(Cell a, Cell b) {
    if (a.row == b.row && a.col == b.col) return;

    bool isMatch = (a.value == b.value) || (a.value + b.value == 10);
    if (isMatch) {
      a.matched = true;
      b.matched = true;
      score += 10;
    }
    notifyListeners();
  }

  void addRow() {
    for (int c = 0; c < cols; c++) {
      for (int r = rows - 1; r > 0; r--) {
        grid[r][c] = grid[r - 1][c];
      }
      grid[0][c] = Cell(row: 0, col: c, value: Random().nextInt(9) + 1);
    }
    notifyListeners();
  }

  void restart() {
    _initGrid();
    notifyListeners();
  }

  void pauseGame() {
    paused = true;
    notifyListeners();
  }

  void resumeGame() {
    paused = false;
    notifyListeners();
  }
}
