import 'package:food_tinder/config/theme_notifier.dart';
import 'package:food_tinder/data/api/dishes_api.dart';
import 'package:food_tinder/data/storages/theme_storage.dart';
import 'package:food_tinder/repositories/dishes_repository.dart';
import 'package:food_tinder/repositories/repositories_interfaces.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

void initServiceLocator() {
  sl.registerSingletonAsync(() async => await SharedPreferences.getInstance());

  // Storages and notifiers
  sl.registerLazySingleton<ThemeStorage>(() => ThemeStorage(prefs: sl()));
  sl.registerLazySingleton<ThemeNotifier>(() => ThemeNotifier(themeStorage: sl()));

  // APIs
  sl.registerLazySingleton<DishesAPI>(() => DishesAPI());

  // Repositories
  sl.registerLazySingleton<DishesRepository>(() => DishesRepositoryImpl(api: sl()));
}
