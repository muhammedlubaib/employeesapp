import 'package:employeesapp/res/style/color.dart';
import 'package:flutter/material.dart';

class AppThemeData {
  static ThemeData lightTheme = ThemeData(
    primaryColor: ColorResources.primary,
    // hintColor: Colors.green,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: ColorResources.buttonColor, shape: CircleBorder()),
    scaffoldBackgroundColor: ColorResources.backgroundColor,
    textTheme: const TextTheme().copyWith(
      bodySmall: const TextStyle(color: ColorResources.textColor),
      bodyMedium: const TextStyle(color: ColorResources.textColor),
      bodyLarge: const TextStyle(color: ColorResources.textColor),
      labelSmall: const TextStyle(color: ColorResources.textColor),
      labelMedium: const TextStyle(color: ColorResources.textColor),
      labelLarge: const TextStyle(color: ColorResources.textColor),
      displaySmall: const TextStyle(color: ColorResources.textColor),
      displayMedium: const TextStyle(color: ColorResources.textColor),
      displayLarge: const TextStyle(color: ColorResources.textColor),
    ),
  );
}


//  ThemeData(
      //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
      //     useMaterial3: true,
      //     scaffoldBackgroundColor: CustomColor.backgroundColor),