import 'package:flutter/material.dart';
import 'package:mcss/app_theme.dart';
import 'package:mcss/domain/mojang_server_status.dart';

class ColorUtils {
  static Color getColorFromPing(int ms) {
    if (ms == null) {
      return AppTheme.disabled;
    } else if (ms < 100) {
      return AppTheme.green;
    } else if (ms < 200) {
      return AppTheme.yellow;
    } else if (ms < 300) {
      return AppTheme.orange;
    } else {
      return AppTheme.red;
    }
  }

  static Color getColorFromStatus(MojangServerStatus status) {
    switch (status) {
      case MojangServerStatus.green:
        return AppTheme.green;
      case MojangServerStatus.yellow:
        return AppTheme.yellow;
      case MojangServerStatus.red:
        return AppTheme.red;
      default:
        return AppTheme.disabled;
    }
  }
}
