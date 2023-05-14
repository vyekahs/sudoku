import 'dart:convert';

import '../../domain/entities/state.entity.dart';

class StateModel extends StatsEntity {
  StateModel({
    required super.totalGames,
    required super.totalTime,
    required super.totalHintsUsed,
    required super.difficultyStats,
  });

  Map<String, dynamic> toMap() {
    return {
      'totalGames': totalGames,
      'totalTime': totalTime,
      'totalHintsUsed': totalHintsUsed,
      'difficultyStats': difficultyStats,
    };
  }

  factory StateModel.fromMap(Map<String, dynamic> map) {
    return StateModel(
      totalGames: map['totalGames']?.toInt() ?? 0,
      totalTime: map['totalTime']?.toDouble() ?? 0.0,
      totalHintsUsed: map['totalHintsUsed']?.toInt() ?? 0,
      difficultyStats: map['difficultyStats'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory StateModel.fromJson(String source) =>
      StateModel.fromMap(json.decode(source));
}
