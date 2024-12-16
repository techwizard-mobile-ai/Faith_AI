// ignore_for_file: use_full_hex_values_for_flutter_colors, prefer_const_constructors

import 'package:myfriendfaith/widgets/custom_circularprogress.dart';
import 'package:flutter/material.dart';

class CountdownClock extends StatefulWidget {
  @override
  _CountdownClockState createState() => _CountdownClockState();
}

class _CountdownClockState extends State<CountdownClock>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int _duration = 300;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: _duration), // Countdown duration
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200, // Set desired width
      height: 200, // Set desired height
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          double currentTime = _duration - _controller.value * _duration;
          return Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 200,
                width: 200,
                child: CustomCircularProgress(progress: 1 - _controller.value),
              ),
              Text(
                '${(currentTime / 3600).floor().toString().padLeft(2, '0')}:${(currentTime / 60).floor().toString().padLeft(2, '0')}:${(currentTime % 60).floor().toString().padLeft(2, '0')}',
                style: TextStyle(
                    fontSize: 25,
                    height: 1.1364,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontFamily: 'Georgia'),
              ),
            ],
          );
        },
      ),
    );
  }
}
