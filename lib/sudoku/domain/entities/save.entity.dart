import 'package:equatable/equatable.dart';

import 'puzzle.entity.dart';

class SaveData extends Equatable {
  final int id;
  final Puzzle puzzle;
  final double elapsedTime;
  final int hintCount;
  final String creationDate;

  const SaveData({
    required this.id,
    required this.puzzle,
    required this.elapsedTime,
    required this.hintCount,
    required this.creationDate,
  });

  @override
  List<Object?> get props => [id, puzzle, elapsedTime, hintCount, creationDate];
}
