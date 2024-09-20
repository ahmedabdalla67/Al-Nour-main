import 'package:flutter/material.dart';
import 'package:mesk/core/utils/colors.dart';
import 'package:mesk/core/utils/font_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    brightness: Brightness.light,
    fontFamily: 'AmiriQuran',
    buttonTheme: const ButtonThemeData(buttonColor: ManageColors.black),
    iconTheme: const IconThemeData(),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(color: ManageColors.primary),
    ),
    textTheme: const TextTheme(
      bodySmall: TextStyle(
          fontWeight: FontWeightManager.light,
          color: ManageColors.gray,
          fontSize: FontSize.s12),
      bodyLarge: TextStyle(
          fontWeight: FontWeightManager.regular,
          color: ManageColors.black,
          fontSize: FontSize.s14),
      titleMedium: TextStyle(
          fontWeight: FontWeightManager.medium,
          color: ManageColors.black,
          fontSize: FontSize.s16),
      headlineMedium: TextStyle(
          fontWeight: FontWeightManager.regular,
          //color: ManageColors.gray,
          fontSize: FontSize.s18),
      headlineLarge: TextStyle(
          fontFamily: FontConstants.fontFamily,
          fontWeight: FontWeightManager.bold,
          color: ManageColors.black,
          fontSize: FontSize.s20),
      displayLarge: TextStyle(
          fontFamily: FontConstants.fontFamily,
          fontWeight: FontWeightManager.bold,
          color: ManageColors.black,
          fontSize: FontSize.s22),
    ),
  );
}
