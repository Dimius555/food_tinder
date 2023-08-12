import 'package:flutter/material.dart';
import 'package:food_tinder/config/theme_notifier.dart';
import 'package:food_tinder/config/ui_theme.dart';
import 'package:food_tinder/pages/home_page/home_page.dart';
import 'package:food_tinder/services/service_locator.dart';
import 'package:provider/provider.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => sl<ThemeNotifier>()),
      ],
      builder: (context, child) {
        final isDarkMode = context.watch<ThemeNotifier>().isDarkMode;
        final isSystemMode = context.watch<ThemeNotifier>().isSystemMode;
        return MaterialApp(
          title: 'Flutter Demo',
          home: const HomePage(title: 'Flutter Demo Home Page'),
          theme: UIThemes.lightTheme(),
          darkTheme: UIThemes.darkTheme(),
          themeMode: isSystemMode
              ? MediaQuery.of(context).platformBrightness == Brightness.light
                  ? ThemeMode.light
                  : ThemeMode.dark
              : isDarkMode
                  ? ThemeMode.dark
                  : ThemeMode.light,
        );
      },
    );
  }
}
