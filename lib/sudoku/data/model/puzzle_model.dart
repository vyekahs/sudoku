import 'package:sudoku/sudoku/domain/entities/puzzle.entity.dart';

import '../../core/enum/difficulty.dart';

class PuzzleModel extends Puzzle {
  const PuzzleModel(
      {required super.puzzleGrid,
      required super.solutionGrid,
      required super.memoGrid,
      required super.difficulty});

  Map<String, dynamic> toMap() {
    return {
      'puzzleGrid': puzzleGrid,
      'solutionGrid': solutionGrid,
      'memoGrid': memoGrid,
      'difficulty': difficulty,
    };
  }

  static Puzzle fromMap(Map<String, dynamic> map) {
    List<List<int>> puzzleGrid = List<List<int>>.from(map['puzzleGrid'])
        .map((row) => List<int>.from(row))
        .toList();
    List<List<int>> solutionGrid = List<List<int>>.from(map['solutionGrid'])
        .map((row) => List<int>.from(row))
        .toList();
    List<List<List<int>>> memoGrid = List<List<List<int>>>.from(map['memoGrid'])
        .map((row) => List<List<int>>.from(row)
            .map((cell) => List<int>.from(cell))
            .toList())
        .toList();
    Difficulty difficulty = map['difficulty'];
    Puzzle puzzle = Puzzle(
        difficulty: difficulty,
        puzzleGrid: puzzleGrid,
        solutionGrid: solutionGrid,
        memoGrid: memoGrid);

    return puzzle;
  }
}
