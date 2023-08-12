import 'package:flutter/material.dart';
import 'package:food_tinder/cubits/cubits_setup.dart';
import 'package:food_tinder/services/service_locator.dart';

void main() async {
  // Убедимся, что все необходимые подсистемы
  // будут настроены и готовы к работе до того, как приложение начнет выполнение.
  WidgetsFlutterBinding.ensureInitialized();

  // Инициализируем зависимости для дальнейших инъекций
  initServiceLocator();

  // Дождемся и убедимся, что все зависимости проинициализорованы
  await sl.allReady();

  // Запускаем приложение с инициализации глобальных кубитов
  runApp(const CubitsSetup());
}
