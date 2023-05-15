import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:sudoku/sudoku/core/enum/difficulty.dart';
import 'package:sudoku/sudoku/data/model/puzzle_model.dart';
import 'package:sudoku/sudoku/domain/entities/difficult_state_entity.dart';

@GenerateNiceMocks([MockSpec<DifficultyStats>()])
void main() {
  late MockDifficultyStats difficultyStats;
  late puzzleModel = PuzzleModel(difficultyStats: difficultyStats, difficulty: Difficulty.beginner, ); 

  setUp(() => {
    mockDifficultyStats = MockDifficultyStats(),

  })

}