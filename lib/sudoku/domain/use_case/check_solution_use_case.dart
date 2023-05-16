import 'package:sudoku/sudoku/domain/entities/puzzle_entity.dart';

class CheckSolutionUseCase {
  bool execute(Puzzle puzzle) {
    return puzzle.isComplete();
  }
}
