import 'dart:ui';

import 'package:flutter/material.dart';

class AppTheme {
  static const primary = const Color(0xFFC07529);
  static const error = const Color(0xFFF85C4D);
  static const background = const Color(0xFF121212);
  static const surface = const Color(0xFF1D1D1D);

  // text
  static const high_emphasis = const Color(0xDEFFFFFF); // 87%
  static const medium_emphasis = const Color(0x9AFFFFFF); // 60%
  static const disabled = const Color(0x61FFFFFF); // 38%

  // indicator
  static const red = const Color(0xFFA20100);
  static const orange = const Color(0xFFF5A902);
  static const yellow = const Color(0xFFF7F752);
  static const green = const Color(0xFF01A501);

  // theme data
  static final themeData = ThemeData(
    fontFamily: 'Lato',
    brightness: Brightness.dark,
    splashColor: Colors.transparent,
    primaryColor: AppTheme.primary,
    accentColor: AppTheme.primary,
    buttonTheme: ButtonThemeData(minWidth: 10),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.transparent),
  );
}
