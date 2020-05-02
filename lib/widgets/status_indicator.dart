import 'package:flutter/material.dart';

class StatusIndicator extends StatelessWidget {
  final Color color;
  final double width;
  final double height;

  const StatusIndicator({
    Key key,
    this.color,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: CustomPaint(
        size: Size(width, height),
        painter: _StatusIndicatorPainter(
          color,
          numberBars: 4,
          spacing: 1,
        ),
      ),
    );
  }
}

class _StatusIndicatorPainter extends CustomPainter {
  final Color color;
  final int numberBars;
  final double spacing; // [0, 1]

  _StatusIndicatorPainter(
    this.color, {
    this.numberBars = 4,
    this.spacing = 1,
  });

  Paint _strokePaint(double strokeWidth) => Paint()
    ..color = color
    ..style = PaintingStyle.stroke
    ..strokeWidth = strokeWidth
    ..strokeJoin = StrokeJoin.round; // trick to have rounded corners

  Paint get _fillPaint => Paint()
    ..color = color
    ..style = PaintingStyle.fill;

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
      path.close();

      canvas.drawPath(path, _strokePaint(width / 20));
      canvas.drawPath(path, _fillPaint);
    }
  }

  @override
  bool shouldRepaint(_StatusIndicatorPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.numberBars != numberBars ||
        oldDelegate.spacing != spacing;
  }
}
