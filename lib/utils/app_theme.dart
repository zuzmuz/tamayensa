import 'package:flutter/material.dart';

class AppColor {
  static const Color foreground = Color(0xFFcbccc6);
  static const Color background = Color(0xFF1F2430);
  static const Color line = Color(0xFF171B24);

  static const Color cyan = Color(0xFF90e1c6);
  static const Color green = Color(0xFFa6cc70);
  static const Color purple = Color(0xFFcfbafa);
  static const Color red = Color(0xFFed8274);
  static const Color white = Color(0xFFc7c7c7);
  static const Color yellow = Color(0xFFfad07b);
}

final ThemeData appTheme = ThemeData(
  colorScheme: const ColorScheme.dark(
    primary: AppColor.foreground,
    onPrimary: AppColor.green,
    secondary: AppColor.background,
    onSecondary: AppColor.green,
    surface: AppColor.background,
    onSurface: AppColor.yellow,
    background: AppColor.line,
    onBackground: AppColor.purple,
    error: AppColor.background,
    onError: AppColor.red,
    brightness: Brightness.dark,
  ),
  fontFamily: 'SpaceMono',
);
