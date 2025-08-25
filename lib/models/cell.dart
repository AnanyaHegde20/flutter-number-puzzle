class Cell {
  final int row;
  final int col;
  final int value;
  bool matched;

  Cell({
    required this.row,
    required this.col,
    required this.value,
    this.matched = false,
  });
}
