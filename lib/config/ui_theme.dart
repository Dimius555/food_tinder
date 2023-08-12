import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_tinder/config/app_colors.dart';

class UIThemes {
  final Brightness brightness;

  UIThemes({this.brightness = Brightness.light});

  // Основная тема приложения (светлая)
  static ThemeData lightTheme() => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        fontFamily: "SF Pro Display",
        scaffoldBackgroundColor: LightModeColors.backgroundPrimary,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.light, statusBarBrightness: Brightness.dark),
          centerTitle: true,
          backgroundColor: LightModeColors.backgroundSecondary,
          elevation: 0,
          shadowColor: Color.fromRGBO(0, 0, 0, 0.1),
        ),
        colorScheme: const ColorScheme.light(
          primary: LightModeColors.accentApp,
          onSecondary: Colors.white,
        ),
        textTheme: const TextTheme(),
      );

  // Альтернативная тема приложения (тёмная)
  static ThemeData darkTheme() => ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        fontFamily: "SF Pro Display",
        scaffoldBackgroundColor: DarkModeColors.backgroundPrimary,
        dividerColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.light, statusBarBrightness: Brightness.dark),
          centerTitle: true,
          backgroundColor: DarkModeColors.backgroundSecondary,
          elevation: 0,
          shadowColor: Color.fromRGBO(0, 0, 0, 0.1),
        ),
      );

  static UIThemes of(BuildContext context) {
    return UIThemes(brightness: Theme.of(context).brightness);
  }

  bool get isDarkTheme => brightness == Brightness.dark;

  TextStyle get appBarTextStyle => TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w700,
        color: isDarkTheme ? DarkModeColors.textPrimary : LightModeColors.textPrimary,
      );

  TextStyle get bottomBarTextStyle => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: textPrimaryColor,
      );

  TextStyle get header17Bold => TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w700,
        color: textPrimaryColor,
      );
  TextStyle get header32Bold => TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: textPrimaryColor,
      );
  TextStyle get header17Semibold => TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: textPrimaryColor,
      );

  TextStyle get header24Bold => TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: textPrimaryColor,
      );

  TextStyle get header24Semibold => TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: textPrimaryColor,
      );

  TextStyle get header24Regular => TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: textPrimaryColor,
      );

  TextStyle get header20Bold => TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: textPrimaryColor,
      );
  TextStyle get header20Semibold => TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: textPrimaryColor,
      );
  TextStyle get header20Regular => TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: textPrimaryColor,
      );

  TextStyle get balance26Bold => TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w700,
        color: textPrimaryColor,
      );

  TextStyle get text12Regular => TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: textPrimaryColor,
      );
  TextStyle get text12Bold => TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: textPrimaryColor,
      );

  TextStyle get text14Regular => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: textPrimaryColor,
      );

  TextStyle get text16Regular => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: textPrimaryColor,
      );
  TextStyle get text17Bold => TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w700,
        color: textPrimaryColor,
      );
  TextStyle get text17Semibold => TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w500,
        color: textPrimaryColor,
      );
  TextStyle get text17Regular => TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        color: textPrimaryColor,
      );

  TextStyle get text12Semibold => TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: textPrimaryColor,
      );

  TextStyle get text14Semibold => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: textPrimaryColor,
      );
  TextStyle get text14Bold => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: textPrimaryColor,
      );

  TextStyle get button12Semibold => TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: textPrimaryColor,
      );

  TextStyle get button14Semibold => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: textPrimaryColor,
      );

  TextStyle get button16Semibold => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: textPrimaryColor,
      );

  /// Specific colors

  Color get whiteColor => Colors.white;
  Color get primaryButtonTitleColor => isDarkTheme ? LightModeColors.backgroundPrimary : LightModeColors.backgroundPrimary;

  // UIKit colors

  Color get shadowColor => isDarkTheme ? DarkModeColors.shadow : LightModeColors.shadow;
  Color get accentPositiveColor => isDarkTheme ? DarkModeColors.accentPositive : LightModeColors.accentPositive;
  Color get accentNegativeColor => isDarkTheme ? DarkModeColors.accentNegative : LightModeColors.accentNegative;
  Color get accentNegativeAlternativeColor => isDarkTheme ? DarkModeColors.accentNegativeAlternative : LightModeColors.accentNegativeAlternative;
  Color get accentWarningColor => isDarkTheme ? DarkModeColors.accentWarning : LightModeColors.accentWarning;
  Color get accentApp => isDarkTheme ? DarkModeColors.accentApp : LightModeColors.accentApp;

  Color get backgroundPrimaryColor => isDarkTheme ? DarkModeColors.backgroundPrimary : LightModeColors.backgroundPrimary;
  Color get backgroundSecondaryColor => isDarkTheme ? DarkModeColors.backgroundSecondary : LightModeColors.backgroundSecondary;
  Color get backgroundStrokeColor => isDarkTheme ? DarkModeColors.backgroundStroke : LightModeColors.backgroundStroke;

  Color get iconPrimaryColor => isDarkTheme ? DarkModeColors.iconPrimary : LightModeColors.iconPrimary;
  Color get iconSecondaryColor => isDarkTheme ? DarkModeColors.iconSecondary : LightModeColors.iconSecondary;
  Color get iconPositiveColor => isDarkTheme ? DarkModeColors.iconPositive : LightModeColors.iconPositive;
  Color get iconNegativeColor => isDarkTheme ? DarkModeColors.iconNegative : LightModeColors.iconNegative;
  Color get textPrimaryColor => isDarkTheme ? DarkModeColors.textPrimary : LightModeColors.textPrimary;
  Color get textSecondaryColor => isDarkTheme ? DarkModeColors.textSecondary : LightModeColors.textSecondary;
  Color get textTertiaryColor => isDarkTheme ? DarkModeColors.textTertiary : LightModeColors.textTertiary;
  Color get textPositiveColor => isDarkTheme ? DarkModeColors.textPositive : LightModeColors.textPositive;
  Color get textNegativeColor => isDarkTheme ? DarkModeColors.textNegative : LightModeColors.textNegative;
  Color get iconBorderColor => isDarkTheme ? LightModeColors.iconSecondary : DarkModeColors.iconSecondary;
  Color get newsWidgetColor => isDarkTheme ? const Color.fromARGB(255, 88, 88, 88) : const Color.fromARGB(255, 221, 235, 251);
}
