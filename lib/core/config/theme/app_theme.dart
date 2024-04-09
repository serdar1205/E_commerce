import 'package:flutter/material.dart';
import 'package:tehno_mir/core/constants/colors/app_colors.dart';

abstract class _LightColors {
  static const background = AppColors.backgroundLightColor;
  static const card = AppColors.cardLightColor;
}

abstract class AppTheme {
  static final visualDensity = VisualDensity.adaptivePlatformDensity;
  /// Light theme
  static ThemeData light() => ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.curnil,
    hintColor: AppColors.textGrayColor,
    visualDensity: visualDensity,
    iconTheme: const IconThemeData(color: AppColors.textDarkColor),
    iconButtonTheme: IconButtonThemeData(style: ButtonStyle(iconColor: MaterialStateProperty.all(AppColors.textDarkColor))),
    buttonTheme: const ButtonThemeData(
      colorScheme: ColorScheme.light(primary: AppColors.curnil),
    ),

    drawerTheme: const DrawerThemeData(
      backgroundColor: AppColors.appBarLightColor,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.appBarLightColor,
      titleTextStyle: TextStyle(
        color: AppColors.textDarkColor,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      iconTheme: IconThemeData(color: AppColors.textDarkColor),
      elevation: 0,
    ),
    scaffoldBackgroundColor: _LightColors.background,
    cardColor: _LightColors.card,
    primaryTextTheme:  const TextTheme(
      titleLarge: TextStyle(
        color: AppColors.textDarkColor,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: AppColors.textDarkColor,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        letterSpacing: 1.5,
        height: 1.3,
        fontWeight: FontWeight.w400,
        color: AppColors.textDarkColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.textDarkColor,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: AppColors.textGrayColor,
      ),
    ),
  );
}
