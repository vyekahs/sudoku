import '../entities/setting_entity.dart';
import '../repository/settings_repository.dart';

class UpdateSettingsUseCase {
  final SettingsRepository _settingsRepository;

  UpdateSettingsUseCase(this._settingsRepository);

  Future<void> execute(Settings newSettings) async {
    // 새로운 설정을 적용하여 애플리케이션 설정을 업데이트합니다.
    await _settingsRepository.updateSettings(newSettings);
  }
}
