import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:core';
import 'dart:ui';

class WaveAnimationWidget extends StatefulWidget {
  final botSaying;
  const WaveAnimationWidget({Key? key, required this.botSaying})
      : super(key: key);

  @override
  _WaveAnimationWidgetState createState() => _WaveAnimationWidgetState();
}

class _WaveAnimationWidgetState extends State<WaveAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          size: Size(
              double.infinity,
              MediaQuery.of(context)
                  .size
                  .height), // Set the desired size of the wave
          painter: WavePainter2(_controller.value, widget.botSaying),
        );
      },
    );
  }
}

class WavePainter2 extends CustomPainter {
  final double progress;
  final bool botSaying;
  WavePainter2(this.progress, this.botSaying);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.5) // Semi-transparent wave color
      ..style = PaintingStyle.fill;
    paint.shader = LinearGradient(
      colors: [
        Colors.white.withOpacity(0.6), // Top of the wave
        Colors.white.withOpacity(0), // Bottom of the wave
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    final shadowPaint = Paint()
      ..color = Color(0x55F6D59D)
      ..strokeWidth = 3
      ..imageFilter = ImageFilter.blur(sigmaX: 5, sigmaY: 5)
      ..style = PaintingStyle.stroke;

    final linePaint = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();
    final npath = Path()..moveTo(0, size.height / 2 + 40);
    final waveLength = size.width / 2; // Full wave length (trough to trough)

    // Start drawing the wave
    path.moveTo(0, size.height / 2); // Start at the middle left of the canvas

    // Create wave pattern by repeating sine waves
    for (double x = 0; x <= size.width; x++) {
      final sine = (cos(2 * pi * x / waveLength * (progress + 0.2))) *
          (botSaying ? 230 : 70); // Sine wave formula
      path.lineTo(x, size.height / 2 + (0.7 - progress) * sine + 40);
      npath.lineTo(x, size.height / 2 + (0.7 - progress) * sine + 40);
    }

    // Close the wave (connect it to the bottom of the canvas)
    path.lineTo(size.width, size.height); // Bottom-right corner
    path.lineTo(0, size.height); // Bottom-left corner
    path.close();
    // Draw the wave shape on the canvas
    canvas.drawPath(path, paint);
    canvas.drawPath(npath, shadowPaint);
    canvas.drawPath(npath, linePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
