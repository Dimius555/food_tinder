import 'package:food_tinder/config/theme_notifier.dart';
import 'package:food_tinder/data/storages/theme_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

void initServiceLocator() {
  sl.registerSingletonAsync(() async => await SharedPreferences.getInstance());

  sl.registerLazySingleton<ThemeStorage>(() => ThemeStorage(prefs: sl()));
  sl.registerLazySingleton<ThemeNotifier>(() => ThemeNotifier(themeStorage: sl()));
}
