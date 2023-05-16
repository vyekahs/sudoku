import '../../core/enum/difficulty.dart';
import '../entities/puzzle_entity.dart';

class GetPuzzleUseCase {
  Future<Puzzle> execute(Difficulty difficulty) async {
    return Puzzle(difficulty: difficulty);
  }
}
