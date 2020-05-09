import 'dart:ui';

import 'package:flutter/material.dart';

class AppTheme {
  static const primary = const Color(0xFF7EB6FF);
  static const error = const Color(0xFFF85C4D);
  static const background = const Color(0xFF131316);
  static const surface = const Color(0xFF1B1B1F);
  static const highlight = const Color(0xFF242428);

  // text
  static const high_emphasis = const Color(0xFFD3D3D4);
  static const medium_emphasis = const Color(0xFF7E7E80);
  static const disabled = const Color(0xFF323234);

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
