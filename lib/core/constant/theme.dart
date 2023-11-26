import 'package:flutter/material.dart';

import 'color.dart';

ThemeData themeEnglish = ThemeData(
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: AppColor.fifthColor),
    appBarTheme: const AppBarTheme(
        centerTitle: true, surfaceTintColor: Colors.white, elevation: 25),
    switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all(Colors.white),
        trackColor: MaterialStateProperty.resolveWith((states) =>
            states.contains(MaterialState.selected)
                ? Colors.green
                : Colors.grey)),
    fontFamily: 'Cairo',
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.red,
      secondary: Colors.redAccent,
      surfaceTint: Colors.grey,
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: AppColor.black,
      ),
      displayMedium: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: AppColor.black,
      ),
      bodyLarge: TextStyle(
          height: 1.8,
          color: AppColor.grey,
          fontWeight: FontWeight.w500,
          fontSize: 15),
      bodyMedium: TextStyle(
        height: 1.8,
        color: AppColor.grey,
        fontSize: 14,
      ),
    ));
ThemeData themeArabic = ThemeData(
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColor.fifthColor,
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      surfaceTintColor: Colors.white,
      elevation: 25,
    ),
    switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all(Colors.white),
        trackColor: MaterialStateProperty.resolveWith((states) =>
            states.contains(MaterialState.selected)
                ? Colors.green
                : Colors.grey)),
    fontFamily: 'Cairo',
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.red,
      secondary: Colors.redAccent,
      surfaceTint: Colors.grey,
    ),
    useMaterial3: true,
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: AppColor.black,
      ),
      displayMedium: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: AppColor.black,
      ),
      bodyLarge: TextStyle(
          height: 1.8,
          color: AppColor.grey,
          fontWeight: FontWeight.w500,
          fontSize: 15),
      bodyMedium: TextStyle(
        height: 1.8,
        color: AppColor.grey,
        fontSize: 14,
      ),
    ));
