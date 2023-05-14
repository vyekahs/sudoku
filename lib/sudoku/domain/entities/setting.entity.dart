class Settings {
  bool soundEnabled;
  bool zoomEnabled;
  bool scoreDisplay;
  bool autoErrorChecking;
  int errorLimit;
  bool hideNumbers;
  bool highlightDuplicates;
  bool highlightSelectedArea;
  bool memoEnabled;

  Settings({
    required this.soundEnabled,
    required this.zoomEnabled,
    required this.scoreDisplay,
    required this.autoErrorChecking,
    required this.errorLimit,
    required this.hideNumbers,
    required this.highlightDuplicates,
    required this.highlightSelectedArea,
    required this.memoEnabled,
  });

  void updateSettings(Settings newSettings) {
    soundEnabled = newSettings.soundEnabled;
    zoomEnabled = newSettings.zoomEnabled;
    scoreDisplay = newSettings.scoreDisplay;
    autoErrorChecking = newSettings.autoErrorChecking;
    errorLimit = newSettings.errorLimit;
    hideNumbers = newSettings.hideNumbers;
    highlightDuplicates = newSettings.highlightDuplicates;
    highlightSelectedArea = newSettings.highlightSelectedArea;
    memoEnabled = newSettings.memoEnabled;
  }
}
