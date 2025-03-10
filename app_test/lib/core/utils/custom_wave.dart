import 'package:flutter/material.dart';

class WaveformPainter extends CustomPainter {
  final List<double> amplitudes;

  WaveformPainter(this.amplitudes);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;

    double widthStep = size.width / (amplitudes.length + 1);
    for (int i = 0; i < amplitudes.length; i++) {
      double height = (amplitudes[i] + 60) * 1.5; // Normalize amplitude
      canvas.drawLine(
        Offset(i * widthStep, size.height / 2 - height / 2),
        Offset(i * widthStep, size.height / 2 + height / 2),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
