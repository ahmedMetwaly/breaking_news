import 'package:flutter/material.dart';
import 'package:breaking_news/resources/colors_manager.dart';
import 'package:breaking_news/resources/text_manager.dart';

import 'values_manager.dart';

class ThemeManager {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: const Color.fromARGB(255, 255, 82, 2),
      onPrimary: const Color.fromARGB(255, 255, 255, 1),
      secondary: ColorsManager.backgroundDark,
      onSecondary: ColorsManager.backgroundDark,
      error: ColorsManager.error,
      onError: ColorsManager.error.withOpacity(0.4),
      background: ColorsManager.backgroundDark,
      onBackground: ColorsManager.backgroundDark.withOpacity(0.4),
      surface:  const Color.fromARGB(255, 255, 82, 2),
      onSurface: ColorsManager.lightPrimary,
      inversePrimary: ColorsManager.white,
      outline: ColorsManager.lightPrimary,
      
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.backgroundLight,
      titleTextStyle: FontManager.getAppBarTextStyle(),
      
    ),
    textTheme: TextTheme(
      headlineLarge: FontManager.getHeadLineLargeStyle(),
      headlineMedium: FontManager.getHeadLineStyle(),
      headlineSmall: FontManager.getTabBarStyle(),
      bodyMedium: FontManager.getBodyTextStyle(),
      bodyLarge: FontManager.getBodyLargeTextStyle(),
      bodySmall: FontManager.getHintTextStyle(),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorsManager.lightPrimary.withOpacity(0.18),
      labelStyle: FontManager.getBodyTextStyle()
          .copyWith(color: ColorsManager.lightPrimary),
      hintStyle: FontManager.getHintTextStyle()
          .copyWith(color: ColorsManager.lightPrimary),
      border: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(SizeManager.borderRadiusOfInputField),
          borderSide: const BorderSide(
            color: ColorsManager.lightPrimary,
          )),
      errorBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(SizeManager.borderRadiusOfInputField),
          borderSide: const BorderSide(
            color: ColorsManager.error,
          )),
      focusedBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(SizeManager.borderRadiusOfInputField),
          borderSide: const BorderSide(
            color: ColorsManager.lightPrimary,
          )),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(SizeManager.borderRadiusOfInputField),
          borderSide: const BorderSide(
            color: ColorsManager.error,
          )),
    ),
  );

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: const Color.fromARGB(255, 33, 84, 98),
      onPrimary: const Color.fromARGB(255, 126, 175, 189),
      secondary: ColorsManager.backgroundLight,
      onSecondary: ColorsManager.backgroundLight,
      error: ColorsManager.error,
      onError: ColorsManager.error.withOpacity(0.4),
      background: ColorsManager.backgroundLight,
      onBackground: ColorsManager.backgroundLight.withOpacity(0.4),
      surface: ColorsManager.black,
      onSurface: ColorsManager.lightPrimary,
      inversePrimary: ColorsManager.white,
      outline: ColorsManager.lightPrimary,

    ),
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.backgroundLight,
      titleTextStyle: FontManager.getAppBarTextStyle(),

    ),
    textTheme: TextTheme(
      headlineLarge: FontManager.getHeadLineLargeStyle(),
      headlineMedium: FontManager.getHeadLineStyle(),
      headlineSmall: FontManager.getTabBarStyle(),
      bodyMedium: FontManager.getBodyTextStyle(),
      bodyLarge: FontManager.getBodyLargeTextStyle(),
      bodySmall: FontManager.getHintTextStyle(),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorsManager.lightPrimary.withOpacity(0.18),
      labelStyle: FontManager.getBodyTextStyle()
          .copyWith(color: ColorsManager.lightPrimary),
      hintStyle: FontManager.getHintTextStyle()
          .copyWith(color: ColorsManager.lightPrimary),
      border: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(SizeManager.borderRadiusOfInputField),
          borderSide: const BorderSide(
            color: ColorsManager.lightPrimary,
          )),
      errorBorder: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(SizeManager.borderRadiusOfInputField),
          borderSide: const BorderSide(
            color: ColorsManager.error,
          )),
      focusedBorder: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(SizeManager.borderRadiusOfInputField),
          borderSide: const BorderSide(
            color: ColorsManager.lightPrimary,
          )),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(SizeManager.borderRadiusOfInputField),
          borderSide: const BorderSide(
            color: ColorsManager.error,
          )),
    ),
  );
}
