import 'package:sudoku/sudoku/domain/entities/setting_entity.dart';

abstract class SettingsRepository {
  Future<Settings> getSettings();
  Future<void> updateSettings(Settings settings);
}
