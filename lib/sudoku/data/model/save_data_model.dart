import 'dart:convert';
import '../../domain/entities/save_entity.dart';
import 'puzzle_model.dart';

class SaveDataModel extends SaveData {
  late final PuzzleModel puzzleModel;
  SaveDataModel(
      {required super.id,
      required super.puzzle,
      required super.elapsedTime,
      required super.hintCount,
      required super.createdDate}) {
    puzzleModel = puzzle as PuzzleModel;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'puzzle': puzzleModel.toJson(),
      'elapsedTime': elapsedTime,
      'hintCount': hintCount,
      'creationDate': createdDate,
    };
  }

  factory SaveDataModel.fromMap(Map<String, dynamic> map) {
    return SaveDataModel(
      id: map['id']?.toInt() ?? 0,
      puzzle: PuzzleModel.fromJson(map['puzzle']),
      elapsedTime: map['elapsedTime']?.toDouble() ?? 0.0,
      hintCount: map['hintCount']?.toInt() ?? 0,
      createdDate: map['creationDate'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SaveDataModel.fromJson(String source) =>
      SaveDataModel.fromMap(json.decode(source));
}
