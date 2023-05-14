import 'package:equatable/equatable.dart';

import '../../core/enum/difficulty.dart';

class Puzzle extends Equatable {
  final List<List<int>> puzzleGrid;
  final List<List<int>> solutionGrid;
  final List<List<List<int>>> memoGrid;
  final Difficulty difficulty;
  const Puzzle({
    required this.puzzleGrid,
    required this.solutionGrid,
    required this.memoGrid,
    required this.difficulty,
  });

  void setNumber(int row, int col, int number) {
    puzzleGrid[row][col] = number;
  }

  int getNumber(int row, int col) {
    return puzzleGrid[row][col];
  }

  int getSolutionNumber(int row, int col) {
    return solutionGrid[row][col];
  }

  bool isFilled(int row, int col) {
    return puzzleGrid[row][col] != 0;
  }

  bool isCorrect(int row, int col, int number) {
    // Check if the number already exists in the same row
    for (int i = 0; i < 9; i++) {
      if (puzzleGrid[row][i] == number && i != col) {
        return false;
      }
    }

    // Check if the number already exists in the same column
    for (int i = 0; i < 9; i++) {
      if (puzzleGrid[i][col] == number && i != row) {
        return false;
      }
    }

    // Check if the number already exists in the same 3x3 grid
    int gridRow = (row ~/ 3) * 3;
    int gridCol = (col ~/ 3) * 3;

    for (int i = gridRow; i < gridRow + 3; i++) {
      for (int j = gridCol; j < gridCol + 3; j++) {
        if (puzzleGrid[i][j] == number && (i != row || j != col)) {
          return false;
        }
      }
    }

    return true;
  }

  bool isComplete() {
    for (int row = 0; row < 9; row++) {
      for (int col = 0; col < 9; col++) {
        if (puzzleGrid[row][col] == 0) {
          return false;
        }
      }
    }
    return true;
  }

  void setMemo(int row, int col, int number) {
    memoGrid[row][col].add(number);
  }

  List<int> getMemo(int row, int col) {
    return memoGrid[row][col];
  }

  void clearMemo(int row, int col) {
    memoGrid[row][col] = [];
  }

  @override
  List<Object?> get props => [puzzleGrid, solutionGrid, memoGrid, difficulty];
}
