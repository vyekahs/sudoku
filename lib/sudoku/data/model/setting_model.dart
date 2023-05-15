import 'dart:convert';

import 'package:sudoku/sudoku/domain/entities/setting_entity.dart';

class SettingModel extends Settings {
  SettingModel(
      {required super.soundEnabled,
      required super.zoomEnabled,
      required super.scoreDisplay,
      required super.autoErrorChecking,
      required super.errorLimit,
      required super.hideNumbers,
      required super.highlightDuplicates,
      required super.highlightSelectedArea,
      required super.memoEnabled});

  Map<String, dynamic> toMap() {
    return {
      'soundEnabled': soundEnabled,
      'zoomEnabled': zoomEnabled,
      'scoreDisplay': scoreDisplay,
      'autoErrorChecking': autoErrorChecking,
      'errorLimit': errorLimit,
      'hideNumbers': hideNumbers,
      'highlightDuplicates': highlightDuplicates,
      'highlightSelectedArea': highlightSelectedArea,
      'memoEnabled': memoEnabled,
    };
  }

  factory SettingModel.fromMap(Map<String, dynamic> json) {
    return SettingModel(
      soundEnabled: json['soundEnabled'] ?? false,
      zoomEnabled: json['zoomEnabled'] ?? false,
      scoreDisplay: json['scoreDisplay'] ?? false,
      autoErrorChecking: json['autoErrorChecking'] ?? false,
      errorLimit: json['errorLimit'] ?? 0,
      hideNumbers: json['hideNumbers'] ?? false,
      highlightDuplicates: json['highlightDuplicates'] ?? false,
      highlightSelectedArea: json['highlightSelectedArea'] ?? false,
      memoEnabled: json['memoEnabled'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory SettingModel.fromJson(String source) =>
      SettingModel.fromMap(json.decode(source));
}
