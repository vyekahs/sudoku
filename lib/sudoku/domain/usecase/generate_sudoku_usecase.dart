import 'package:sudoku/sudoku/domain/entities/save_entity.dart';

import '../../core/enum/difficulty.dart';
import '../../core/services/guid_gen.dart';
import '../entities/puzzle_entity.dart';

class GenerateSudokuUseCase {
  final Difficulty difficulty;

  GenerateSudokuUseCase({required this.difficulty});

  SaveData call() {
    Puzzle puzzle = Puzzle(difficulty: difficulty);
    puzzle.init();
    SaveData saveData = SaveData(
      id: GUIDGen.generate(),
      puzzle: puzzle,
      elapsedTime: 0,
      hintCount: 0,
      createdDate: DateTime.now().toString(),
    );
    return saveData;
  }
}
