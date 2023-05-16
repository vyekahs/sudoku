import 'package:sudoku/sudoku/domain/entities/game_entity.dart';

import '../repository/game_repository.dart';

class GetSavedGameUseCase {
  final SaveDataRepository _gameRepository;

  GetSavedGameUseCase(this._gameRepository);

  Future<GameData> execute() async {
    // 저장된 게임을 가져옵니다.
    GameData savedGame = await _gameRepository.getSavedGame();
    return savedGame;
  }
}
