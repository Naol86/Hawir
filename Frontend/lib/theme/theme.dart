import 'package:flutter/material.dart';
import 'colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.backgroundColor,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primaryColor,
        primaryContainer: AppColors.primaryVariantColor,
        secondary: AppColors.secondaryColor,
        secondaryContainer: AppColors.secondaryVariantColor,
        surface: AppColors.surfaceColor,
        background: AppColors.backgroundColor,
        error: AppColors.errorColor,
        onPrimary: AppColors.onPrimaryColor,
        onSecondary: AppColors.onSecondaryColor,
        onSurface: AppColors.onSurfaceColor,
        onBackground: AppColors.onBackgroundColor,
        onError: AppColors.onErrorColor,
      ),
      appBarTheme: const AppBarTheme(
        color: AppColors.primaryColor,
        titleTextStyle: TextStyle(
            color: AppColors.onPrimaryColor,
            fontSize: 20,
            fontFamily: 'poppins'),
        iconTheme: IconThemeData(color: AppColors.onPrimaryColor),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
            color: AppColors.onBackgroundColor, fontFamily: 'Poppins'),
        bodyMedium: TextStyle(
            color: AppColors.onBackgroundColor, fontFamily: 'Poppins'),
        headlineSmall: TextStyle(
            color: AppColors.onBackgroundColor, fontFamily: 'Poppins'),
        titleLarge: TextStyle(
            color: AppColors.onBackgroundColor, fontFamily: 'Poppins'),
        labelLarge: TextStyle(
            color: AppColors.onBackgroundColor, fontFamily: 'Poppins'),
        bodySmall: TextStyle(
            color: AppColors.onBackgroundColor, fontFamily: 'Poppins'),
        titleMedium: TextStyle(
            color: AppColors.onBackgroundColor, fontFamily: 'Poppins'),
        titleSmall: TextStyle(
            color: AppColors.onBackgroundColor, fontFamily: 'Poppins'),
        labelSmall: TextStyle(
            color: AppColors.onBackgroundColor, fontFamily: 'Poppins'),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: AppColors.primaryColor,
        textTheme: ButtonTextTheme.primary,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.secondaryColor,
      ),
    );
  }
}
