import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsService {
  static const bool IS_FULL_SCREEN_DEFAULT = false;
  static const int THEME_MODE_LIGHT_INDEX = 1;

  Future<bool> isFullScreenEnabled() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("Settings.fullScreenEnabled") ??
        IS_FULL_SCREEN_DEFAULT;
  }

  Future<void> setFullScreen(bool enableFullScreen) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("Settings.fullScreenEnabled", enableFullScreen);
  }

  Future<int> getThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt("Settings.themeMode") ?? THEME_MODE_LIGHT_INDEX;
  }

  Future<void> setThemeMode(ThemeMode themeMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt("Settings.themeMode", themeMode.index);
  }
}
