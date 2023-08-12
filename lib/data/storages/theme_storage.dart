import 'package:shared_preferences/shared_preferences.dart';

/// Локальное хранилище данных тёмной темы.
class ThemeStorage {
  final SharedPreferences prefs;

  const ThemeStorage({
    required this.prefs,
  });

  static const String _isDarkMode = 'darkMode_isDarkMode';
  static const String _isSystemMode = 'system_isSystemMode';

  Future<(bool, bool)> setIsDarkMode({required bool value, required bool isSystemMode}) async {
    final res1 = await prefs.setBool(_isDarkMode, value);
    final res2 = await prefs.setBool(_isSystemMode, isSystemMode);
    return (res1, res2);
  }

  (bool, bool) getIsDarkMode() {
    final mode = prefs.getBool(_isDarkMode) ?? false;
    final system = prefs.getBool(_isSystemMode) ?? false;
    return (mode, system);
  }

  Future<bool> removeIsDarkMode() async {
    return await prefs.remove(_isDarkMode);
  }
}
