import 'package:flutter/material.dart';
import 'package:mcss/app_theme.dart';

class Indicator extends CustomPainter {
  final int ms;
  final int numberBars;
  final double spacing; // [0, 1]

  Indicator(
    this.ms, {
    this.numberBars = 4,
    this.spacing = 1,
  });

  Color get _color {
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

  Paint get _paint => Paint()
    ..color = _color
    ..style = PaintingStyle.fill
    ..strokeCap = StrokeCap.round;

  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;

    final dx = width / (numberBars / spacing + numberBars - 1);
    final dy = height / width;

    for (int i = 0; i < numberBars; i++) {
      final xMin = ((1 / spacing) + 1) * i * dx;
      final xMax = xMin + (1 / spacing) * dx;

      final Path path = Path();
      path.moveTo(xMin, height);
      path.lineTo(xMax, height);
      path.lineTo(xMax, height - xMax * dy);
      path.lineTo(xMin, height - xMin * dy);
      canvas.drawPath(path, _paint);
    }
  }

  @override
  bool shouldRepaint(Indicator oldDelegate) {
    return oldDelegate.ms != ms ||
        oldDelegate.numberBars != numberBars ||
        oldDelegate.spacing != spacing;
  }
}
