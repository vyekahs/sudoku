import 'package:sudoku/sudoku/domain/entities/game_entity.dart';
import 'package:sudoku/sudoku/domain/repository/game_repository.dart';

class SaveGameUseCase {
  final SaveDataRepository _gameRepository;

  SaveGameUseCase(this._gameRepository);

  Future<void> execute(GameData game) async {
    await _gameRepository.saveGame(game);
  }
}
