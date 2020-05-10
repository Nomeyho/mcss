import 'package:flutter/widgets.dart';

class ResponsiveUtils {
  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width > 500;
  }
}
