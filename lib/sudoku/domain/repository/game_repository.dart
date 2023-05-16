import 'package:sudoku/sudoku/domain/entities/game_entity.dart';

abstract class SaveDataRepository {
  Future<void> saveGame(GameData game);
  Future<GameData> getSavedGame();
}
