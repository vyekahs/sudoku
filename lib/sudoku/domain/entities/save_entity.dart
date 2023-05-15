import 'package:equatable/equatable.dart';

import 'puzzle_entity.dart';

class SaveData extends Equatable {
  final String id;
  final Puzzle puzzle;
  final double elapsedTime;
  final int hintCount;
  final String createdDate;

  const SaveData({
    required this.id,
    required this.puzzle,
    required this.elapsedTime,
    required this.hintCount,
    required this.createdDate,
  });

  @override
  List<Object?> get props => [id, puzzle, elapsedTime, hintCount, createdDate];
}
