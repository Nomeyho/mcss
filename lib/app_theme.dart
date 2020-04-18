import 'dart:ui';

import 'package:flutter/material.dart';

class AppTheme {
  static const primary = Color(0xFFC07529);
  static const error = Color(0xFFF85C4D);
  static const background = Color(0xFF121212);
  static const surface = Color(0xFF1D1D1D);

  // text
  static const high_emphasis = const Color(0xDEFFFFFF); // 87%
  static const medium_emphasis = Color(0x9AFFFFFF); // 60%
  static const disabled = Color(0x61FFFFFF); // 38%

  // theme data
  static final themeData = ThemeData(
    brightness: Brightness.dark,
    splashColor: Colors.transparent,
    primaryColor: AppTheme.primary,
    accentColor: AppTheme.primary,
    buttonTheme: ButtonThemeData(minWidth: 10),
  );
}
