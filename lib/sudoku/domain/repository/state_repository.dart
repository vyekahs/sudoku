import '../entities/game_entity.dart';
import '../entities/state_entity.dart';

abstract class StateRepository {
  Future<StatsEntity> getState();
  Future<void> updateStats(GameData gameData);
}
