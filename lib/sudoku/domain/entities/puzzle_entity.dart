import 'dart:math';

import 'package:equatable/equatable.dart';

import '../../core/enum/difficulty.dart';

class Puzzle extends Equatable {
  late List<List<int>> _puzzleGrid;
  late List<List<int>> _solutionGrid;
  late List<List<List<int>>> _memoGrid;
  final Difficulty difficulty;
  Puzzle({
    required this.difficulty,
  });

  void init() {
    _generateSudoku(difficulty);
    _memoGrid = List.generate(9, (_) => List.generate(9, (_) => <int>[]));
  }

  void setNumber(int row, int col, int number) {
    _puzzleGrid[row][col] = number;
  }

  int getNumber(int row, int col) {
    return _puzzleGrid[row][col];
  }

  int getSolutionNumber() {
    for (var i = 0; i < _puzzleGrid.length; i++) {
      for (var j = 0; j < _puzzleGrid[i].length; j++) {
        if (_puzzleGrid[i][j] == 0) {
          return _solutionGrid[i][j];
        }
      }
    }
    return 0;
  }

  bool isComplete() {
    for (int row = 0; row < 9; row++) {
      for (int col = 0; col < 9; col++) {
        if (_puzzleGrid[row][col] == 0) {
          return false;
        }
      }
    }
    return true;
  }

  void setMemo(int row, int col, int number) {
    _memoGrid[row][col].add(number);
  }

  List<int> getMemo(int row, int col) {
    return _memoGrid[row][col];
  }

  void clearMemo(int row, int col) {
    _memoGrid[row][col] = [];
  }

  bool isValid(int row, int col, int num) {
    for (int x = 0; x < 9; x++) {
      if (_puzzleGrid[row][x] == num || _puzzleGrid[x][col] == num) {
        return false;
      }
    }

    int startRow = row - row % 3;
    int startCol = col - col % 3;

    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (_puzzleGrid[i + startRow][j + startCol] == num) {
          return false;
        }
      }
    }

    return true;
  }

  @override
  List<Object?> get props =>
      [_puzzleGrid, _solutionGrid, _memoGrid, difficulty];

  void _generateSudoku(Difficulty difficulty) {
    final random = Random();

    List<List<int>> grid = List.generate(9, (_) => List.generate(9, (_) => 0));

    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        grid[i][j] = 0;
      }
    }

    int filledValues;
    switch (difficulty) {
      case Difficulty.beginner:
        filledValues = 45;
        break;
      case Difficulty.novice:
        filledValues = 40;
        break;
      case Difficulty.intermediate:
        filledValues = 35;
        break;
      case Difficulty.advanced:
        filledValues = 30;
        break;
      case Difficulty.expert:
        filledValues = 25;
        break;
      case Difficulty.master:
        filledValues = 20;
        break;
    }

    int count = 0;
    while (count < filledValues) {
      int row = random.nextInt(9);
      int col = random.nextInt(9);
      int num = 1 + random.nextInt(9);

      if (grid[row][col] == 0 && isValid(row, col, num)) {
        grid[row][col] = num;
        count++;
      }
    }

    _solutionGrid =
        List.generate(9, (i) => List.generate(9, (j) => grid[i][j]));

    if (!_solveSudoku(0, 0)) {
      _generateSudoku(difficulty);
    }
  }

  bool _solveSudoku(int row, int col) {
    if (row == 9) {
      return true;
    }

    if (col == 9) {
      return _solveSudoku(row + 1, 0);
    }

    if (_puzzleGrid[row][col] != 0) {
      return _solveSudoku(row, col + 1);
    }

    for (int num = 1; num <= 9; num++) {
      if (isValid(row, col, num)) {
        _puzzleGrid[row][col] = num;

        if (_solveSudoku(row, col + 1)) {
          return true;
        }
      }

      _puzzleGrid[row][col] = 0;
    }

    return false;
  }
}
