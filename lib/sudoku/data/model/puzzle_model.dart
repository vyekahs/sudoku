import 'dart:convert';

import '../../core/enum/difficulty.dart';
import '../../domain/entities/puzzle_entity.dart';

class PuzzleModel extends Puzzle {
  late List<List<int>> _puzzleGrid;
  late List<List<int>> _solutionGrid;
  late List<List<List<int>>> _memoGrid;

  PuzzleModel({
    required Difficulty difficulty,
    required List<List<int>> puzzleGrid,
    required List<List<int>> solutionGrid,
    required List<List<List<int>>> memoGrid,
  }) : super(difficulty: difficulty) {
    _puzzleGrid = puzzleGrid;
    _solutionGrid = solutionGrid;
    _memoGrid = memoGrid;
  }

  Map<String, dynamic> toMap() {
    return {
      'difficulty': difficulty.index,
      'puzzleGrid': _puzzleGrid,
      'solutionGrid': _solutionGrid,
      'memoGrid': _memoGrid,
    };
  }

  factory PuzzleModel.fromMap(Map<String, dynamic> json) {
    return PuzzleModel(
      difficulty: Difficulty.values[json['difficulty']],
      puzzleGrid: List<List<int>>.from(
        json['puzzleGrid'].map((grid) => List<int>.from(grid)),
      ),
      solutionGrid: List<List<int>>.from(
        json['solutionGrid'].map((grid) => List<int>.from(grid)),
      ),
      memoGrid: List<List<List<int>>>.from(
        json['memoGrid'].map(
          (grid) => List<List<int>>.from(
            grid.map((memo) => List<int>.from(memo)),
          ),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory PuzzleModel.fromJson(String source) =>
      PuzzleModel.fromMap(json.decode(source));
}
