import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:core';
import 'dart:ui';

class WaveAnimationWidgetOne extends StatefulWidget {
  final botSaying;
  const WaveAnimationWidgetOne({Key? key, required this.botSaying})
      : super(key: key);

  @override
  _WaveAnimationWidgetOneState createState() => _WaveAnimationWidgetOneState();
}

class _WaveAnimationWidgetOneState extends State<WaveAnimationWidgetOne>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..repeat(reverse: true);
    print(widget.botSaying);
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
          painter: WavePainter(_controller.value, widget.botSaying),
        );
      },
    );
  }
}

class WavePainter extends CustomPainter {
  final double progress;
  final bool botSaying;
  WavePainter(this.progress, this.botSaying);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.5) // Semi-transparent wave color
      ..style = PaintingStyle.fill;
    paint.shader = LinearGradient(
      colors: [
        Colors.white.withOpacity(0.8), // Top of the wave
        Colors.white.withOpacity(0), // Bottom of the wave
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    final shadowPaint = Paint()
      ..color = Color(0xffF6D59D)
      ..strokeWidth = 3
      ..imageFilter = ImageFilter.blur(sigmaX: 5, sigmaY: 5)
      ..style = PaintingStyle.stroke;

    final linePaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();
    final npath = Path()..moveTo(0, size.height / 2 + 50);
    final waveLength = size.width / 1.5; // Full wave length (trough to trough)

    // Start drawing the wave
    path.moveTo(0, size.height / 2); // Start at the middle left of the canvas

    // Create wave pattern by repeating sine waves
    for (double x = 0; x <= size.width; x++) {
      final sine = (sin(2 * pi * x / waveLength + 0.3 * pi)) *
          (botSaying ? 250 : 100); // Sine wave formula
      path.lineTo(x, size.height / 2 + (0.5 - progress) * sine + 50);
      npath.lineTo(x, size.height / 2 + (0.5 - progress) * sine + 50);
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
