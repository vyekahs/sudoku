import 'package:equatable/equatable.dart';

import '../../core/enum/difficulty.dart';
import 'difficult_state.entity.dart';
import 'save.entity.dart';

class StatsEntity extends Equatable {
  final int totalGames;
  final double totalTime;
  final int totalHintsUsed;
  final Map<Difficulty, DifficultyStats> difficultyStats;
  const StatsEntity({
    required this.totalGames,
    required this.totalTime,
    required this.totalHintsUsed,
    required this.difficultyStats,
  });

  StatsEntity updateStats(SaveData gameData) {
    Difficulty difficulty = gameData.puzzle.difficulty;
    DifficultyStats? stats = difficultyStats[difficulty];
    if (stats == null) {
      stats = DifficultyStats(
        games: 1,
        totalTime: gameData.elapsedTime,
        totalHintsUsed: gameData.hintCount,
      );
      difficultyStats[difficulty] = stats;
    }
    stats = DifficultyStats(
      games: stats.games + 1,
      totalTime: stats.totalTime + gameData.elapsedTime,
      totalHintsUsed: stats.totalHintsUsed + gameData.hintCount,
    );

    int games = totalGames + 1;
    double time = totalTime + gameData.elapsedTime;
    int hintsUsed = totalHintsUsed + gameData.hintCount;
    Map<Difficulty, DifficultyStats> newDifficultyStats =
        stats as Map<Difficulty, DifficultyStats>;
    return StatsEntity(
      totalGames: games,
      totalTime: time,
      totalHintsUsed: hintsUsed,
      difficultyStats: newDifficultyStats,
    );
  }

  @override
  List<Object?> get props =>
      [totalGames, totalTime, totalHintsUsed, difficultyStats];
}
