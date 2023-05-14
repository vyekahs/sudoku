import 'package:equatable/equatable.dart';

class DifficultyStats extends Equatable {
  final int games;
  final double totalTime;
  final int totalHintsUsed;

  const DifficultyStats({
    required this.games,
    required this.totalTime,
    required this.totalHintsUsed,
  });

  @override
  List<Object?> get props => [games, totalTime, totalHintsUsed];
}
