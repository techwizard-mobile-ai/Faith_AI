import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui; // Import for work
import 'dart:math';

class C_Canvas extends CustomPainter {
  final List<Offset> starPositions;
  final List<double> progressValues; // 0.0 to 1.0 values to control progress
  final List<String> labels;
  final ui.Image? star;

  C_Canvas(
      {required this.starPositions,
      required this.progressValues,
      required this.labels,
      required this.star});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint starPaint = Paint()..color = Colors.white;
    final Paint linePaint = Paint()
      ..color = Colors.white.withOpacity(0.5)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final Paint shadowPaint = Paint()
      ..color = Color(0x59F0C57959)
      ..strokeWidth = 4
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 10);

    final Paint progressPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    ui.Image image;

    if (star != null) {
      for (final position in starPositions) {
        Offset newPosition = Offset(position.dx - 25, position.dy - 25);
        canvas.drawImage(star!, newPosition, starPaint); // Drawing each star
      }
    }

    // Draw stars (points)

    // Draw lines (representing progress bars)r
    for (int i = 0; i < starPositions.length - 1; i++) {
      final start = starPositions[i];
      final end = starPositions[i + 1];
      final progress = progressValues[i]; // Get progress value for the line

      // Draw progress line
      final progressEnd = Offset(
        start.dx + (end.dx - start.dx) * progress,
        start.dy + (end.dy - start.dy) * progress,
      );
      canvas.drawLine(start, progressEnd, progressPaint);
      canvas.drawLine(start, progressEnd, shadowPaint);

      // Draw the base line (full progress path)
      canvas.drawLine(start, end, linePaint);

      // Draw labels (adjust label positioning as needed)
      final label = labels[i];
      final labelOffset = Offset(
        (start.dx + end.dx) / 2,
        (start.dy + end.dy) / 2,
      );
      Offset offsetLabel = Offset(
          labelOffset.dx + 20, labelOffset.dy - 20); // 20px above the line
      if (i == 0)
        offsetLabel = Offset(labelOffset.dx + 10, labelOffset.dy - 10);
      else if (i == 1)
        offsetLabel = Offset(labelOffset.dx - 10, labelOffset.dy - 10);
      else if (i == 2)
        offsetLabel = Offset(labelOffset.dx + 10, labelOffset.dy - 10);
      else if (i == 3)
        offsetLabel = Offset(labelOffset.dx - 10, labelOffset.dy - 10);
      _drawText(canvas, label, offsetLabel, start, end, progressValues[i] > 0);
    }
  }

  void _drawText(Canvas canvas, String text, Offset offset, Offset start,
      Offset end, bool active) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
            color: active ? Colors.white : Color(0x4DFFFFFF), fontSize: 16),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();

    // Calculate the angle of the line (in radians)
    final dx = end.dx - start.dx;
    final dy = end.dy - start.dy;
    final angle = atan2(dy, dx); // Calculate the angle of the line

    // Save the current canvas state, apply the rotation, draw the text, then restore the canvas state
    canvas.save();
    canvas.translate(
        offset.dx, offset.dy); // Move the canvas to the label position
    canvas.rotate(angle); // Rotate the canvas to align text with the line
    textPainter.paint(
        canvas,
        Offset(-textPainter.width / 2,
            -textPainter.height / 2)); // Center the text
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class GrowthCanva extends StatefulWidget {
  const GrowthCanva();

  @override
  _GrowthCanvaState createState() => _GrowthCanvaState();
}

class _GrowthCanvaState extends State<GrowthCanva> {
  ui.Image? _image;
  Future<void> loadImage() async {
    final ByteData data = await rootBundle.load('assets/images/star.png');
    final List<int> bytes = data.buffer.asUint8List();
    final image = await decodeImageFromList(Uint8List.fromList(bytes));
    setState(() {
      _image = image;
    });
  }

  @override
  void initState() {
    super.initState();
    loadImage(); // Load image when the widget is initialized
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width - 60;
    final List<Offset> stars = [
      Offset(0, 0), // Star positions
      Offset(screenWidth * 43 / 304, screenWidth * 63 / 304),
      Offset(screenWidth * 133 / 304, screenWidth * 37 / 304),
      Offset(screenWidth * 243 / 304, screenWidth * 98 / 304),
      Offset(screenWidth * 304 / 304, screenWidth * 18 / 304),
    ];

    final List<double> progressValues = [
      0.8, // Progress values between 0.0 and 1.0
      0.0,
      0.0,
      0.0,
    ];

    final List<String> labels = [
      'Reflect',
      'Connect',
      'Appreciate',
      'Grow',
    ];

    return Center(
      child: CustomPaint(
        size: Size(500, 120), // Custom size for the canvas
        painter: C_Canvas(
            starPositions: stars,
            progressValues: progressValues,
            labels: labels,
            star: _image),
      ),
    );
  }
}
