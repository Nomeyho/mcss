import 'package:flutter/material.dart';
import 'package:mcss/app_theme.dart';

class ErrorImage extends StatelessWidget {
  final double width;
  final double height;

  const ErrorImage({
    Key key,
    @required this.width,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: AppTheme.disabled.withOpacity(0.1),
    );
  }
}
