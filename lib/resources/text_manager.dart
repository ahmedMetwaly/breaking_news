import 'package:flutter/material.dart';
import 'package:breaking_news/resources/colors_manager.dart';

import 'values_manager.dart';

class FontManager {
  static TextStyle _getTextStyle(double fontSize,
      {Color color = ColorsManager.primaryLight,
      String fontFamily = "Metropolis",
      FontWeight fontWeight = FontWeight.w500}) {
    return TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: fontFamily,
        fontWeight: fontWeight);
  }

  static TextStyle getHeadLineLargeStyle() =>
      _getTextStyle(SizeManager.headLineLargeTextSize,
          fontFamily: "ArchivoBlack",
          fontWeight: FontWeight.w700,
          color: ColorsManager.primaryLight);

  static TextStyle getHeadLineStyle() =>
      _getTextStyle(SizeManager.headLineTextSize, fontWeight: FontWeight.w800);
  static TextStyle getAppBarTextStyle() =>
      _getTextStyle(SizeManager.appBarTextSize);
  static TextStyle getErrorTextStyle() =>
      _getTextStyle(SizeManager.errorTextSize, color: ColorsManager.error);
  static TextStyle getBodyTextStyle() =>
      _getTextStyle(SizeManager.bodyTextSize);
  static TextStyle getBodyLargeTextStyle() =>
      _getTextStyle(SizeManager.bodyLargeTextSize,
          color: ColorsManager.primaryLight, fontWeight: FontWeight.w500);

  static TextStyle getHintTextStyle() =>
      _getTextStyle(SizeManager.bodySmallSize,
          color: ColorsManager.lightPrimary);

  static TextStyle getTabBarStyle() =>
      _getTextStyle(SizeManager.bodyLargeTextSize,
          color: ColorsManager.primaryLight,
          fontWeight: FontWeight.w900,
          fontFamily: "Mulish");
}
