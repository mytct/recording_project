import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class WaveformPainter extends CustomPainter {
  final List<double> decibels;

  WaveformPainter(this.decibels);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..shader = ui.Gradient.linear(
        Offset(0, size.height / 2),
        Offset(size.width, size.height / 2),
        [Colors.yellowAccent, Colors.redAccent], // iOS-like gradient
      )
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true; // Smooth edges

    final Path path = Path();
    double midY = size.height / 2;

    for (int i = 0; i < decibels.length; i++) {
      double x = i * (size.width / decibels.length);
      double normalizedHeight =
          (decibels[i].abs() / 40) * size.height / 2; // Normalize decibels
      double y = midY - normalizedHeight;

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
