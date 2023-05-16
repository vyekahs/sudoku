import 'package:sudoku/sudoku/domain/entities/game_entity.dart';

import '../repository/state_repository.dart';

class UpdateStateUseCase {
  final StateRepository _stateRepository;

  UpdateStateUseCase(this._stateRepository);

  Future<void> execute(GameData gameData) async {
    // 게임 데이터를 기반으로 통계를 업데이트합니다.
    await _stateRepository.updateStats(gameData);
  }
}
