import 'package:flutter/material.dart';
import 'dart:math';

class CustomCircularProgress extends StatelessWidget {
  final double progress; // Value from 0.0 to 1.0

  const CustomCircularProgress({Key? key, required this.progress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(150, 150), // Custom size
      painter: CircularProgressPainter(progress),
    );
  }
}

class CircularProgressPainter extends CustomPainter {
  final double progress;

  CircularProgressPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    Paint backgroundPaint = Paint()
      ..color = Color(0x1AFFFFFF)
      ..strokeWidth = 7
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Paint shadowPaint = Paint()
      ..color = Color(0xB0F6D59D) // Shadow color with opacity
      ..strokeWidth = 13 // Thicker for soft shadow effect
      ..style = PaintingStyle.stroke
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 10) // Blur effect
      ..strokeCap = StrokeCap.round;

    Paint foregroundPaint = Paint()
      ..color = Color(0xFFFFFFFF)
      ..strokeWidth = 7
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double radius = size.width / 2;
    Offset center = Offset(radius, radius);

    // Draw background circle
    canvas.drawCircle(center, radius - 6, backgroundPaint);

    // Draw progress arc
    double sweepAngle = 2 * pi * progress;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - 6),
      -pi / 2,
      sweepAngle,
      false,
      shadowPaint,
    );
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius - 6), -pi / 2,
        sweepAngle, false, foregroundPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Always repaint on value change
  }
}
