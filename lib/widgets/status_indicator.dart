import 'package:flutter/material.dart';

class StatusIndicator extends CustomPainter {
  final Color color;
  final int numberBars;
  final double spacing; // [0, 1]

  StatusIndicator(
    this.color, {
    this.numberBars = 4,
    this.spacing = 1,
  });

  Paint get _paint => Paint()
    ..color = color
    ..style = PaintingStyle.fill
    ..strokeCap = StrokeCap.butt;

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
  bool shouldRepaint(StatusIndicator oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.numberBars != numberBars ||
        oldDelegate.spacing != spacing;
  }
}
