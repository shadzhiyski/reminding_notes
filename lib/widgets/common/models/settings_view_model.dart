import 'package:flutter/material.dart';
import 'package:reminding_notes/core/common/settings_service.dart';

class SettingsViewModel extends ChangeNotifier {
  final SettingsService settingsService;
  late bool _isFullScreen = false;
  late ThemeMode _themeMode = ThemeMode.light;
  late int themeModeIndex = 0;

  SettingsViewModel({
    required this.settingsService,
  }) {
    settingsService
        .isFullScreenEnabled()
        .then((isEnabled) => isFullScreen = isEnabled);

    settingsService.getThemeMode().then((modeIndex) {
      themeModeIndex = modeIndex;
      themeMode = ThemeMode.values[modeIndex];
    });
  }

  bool get isFullScreen => _isFullScreen;
  set isFullScreen(bool value) {
    _isFullScreen = value;
    settingsService.setFullScreen(value).then((_) => notifyListeners());
  }

  bool get isDarkMode => themeModeIndex == ThemeMode.dark.index;
  ThemeMode get themeMode => _themeMode;
  set themeMode(ThemeMode value) {
    _themeMode = value;
    themeModeIndex = value.index;
    settingsService.setThemeMode(value).then((mode) => notifyListeners());
  }
}
