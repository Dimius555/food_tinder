import 'package:flutter/material.dart';
import 'package:food_tinder/data/storages/theme_storage.dart';

/// Оповещение переключения между светлой и тёмной темой.
enum AppColorMode { light, dark, system }

class ThemeNotifier extends ChangeNotifier {
  final ThemeStorage themeStorage;

  ThemeNotifier({required this.themeStorage}) {
    _initMode();
  }

  // Dark mode
  bool _isDarkMode = false;
  bool _isSystemMode = true;
  bool get isDarkMode => _isDarkMode;
  bool get isSystemMode => _isSystemMode;

  void switchTheme(AppColorMode mode, BuildContext context) async {
    switch (mode) {
      case AppColorMode.light:
        await themeStorage.setIsDarkMode(value: false, isSystemMode: false);
        _isDarkMode = false;
        _isSystemMode = false;
        break;
      case AppColorMode.dark:
        await themeStorage.setIsDarkMode(value: true, isSystemMode: false);
        _isDarkMode = true;
        _isSystemMode = false;
        break;
      case AppColorMode.system:
        var systemBrightness = MediaQuery.of(context).platformBrightness;
        if (systemBrightness == Brightness.light) {
          await themeStorage.setIsDarkMode(value: false, isSystemMode: true);
          _isDarkMode = false;
          _isSystemMode = true;
        } else {
          await themeStorage.setIsDarkMode(value: true, isSystemMode: true);
          _isDarkMode = true;
          _isSystemMode = true;
        }
        break;
    }

    notifyListeners();
  }

  void _initMode() async {
    final (isDark, isSystem) = themeStorage.getIsDarkMode();
    _isDarkMode = isDark;
    _isSystemMode = isSystem;
    notifyListeners();
  }
}
