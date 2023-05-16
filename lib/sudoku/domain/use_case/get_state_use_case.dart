import 'package:sudoku/sudoku/domain/entities/state_entity.dart';

import '../repository/state_repository.dart';

class GetStateUseCase {
  final StateRepository _stateRepository;

  GetStateUseCase(this._stateRepository);

  Future<StatsEntity> execute() async {
    // 통계 데이터를 가져와서 반환합니다.
    StatsEntity stats = await _stateRepository.getState();
    return stats;
  }
}
