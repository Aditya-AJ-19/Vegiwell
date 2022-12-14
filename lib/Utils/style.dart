import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static const Color orange = Color(0xFFE4BF7D);
  static const Color orange2 = Color(0xFFF37d34);
  static const Color clip1 = Color(0xFFE4BF7D);
  static const Color clip2 = Color(0xFFDDE779);
  static const Color darktext = Color(0xFF000000);
  static const Color graytext = Color(0xFF4F4F4F);
  static const Color lighttext = Color(0xFF8E8888);
  static const Color background = Color(0xFFEFF4F7);
  // static const Color background = Color(0xFFF1F1F1);
  static const Color numberfield = Color(0xFFE0E0E0);
  static const Color bottomNavigationBar = Color(0xFFEDEDED);
  static const Color green = Color(0xFF42C3A7);
  static const Color lightGreen = Color(0xff7eedd5);
  static const Color darkBlue = Color(0xFF182748);

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppTheme.background,
    brightness: Brightness.light,
    fontFamily: 'Baloo',
  );
}
