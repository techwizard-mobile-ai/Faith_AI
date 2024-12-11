// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'dart:math';

// @RoutePage()
// class CallScreen extends StatefulWidget {
//   const CallScreen({Key? key}) : super(key: key);

//   @override
//   _CallScreenState createState() => _CallScreenState();
// }

// class _CallScreenState extends State<CallScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;

//   @override
//   initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 2),
//     )..repeat();
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _controller,
//       builder: (context, child) {
//         return CustomPaint(
//           painter: WavePainter(_controller.value),
//           child: Center(
//             child: Icon(
//               Icons.call,
//               size: 50,
//               color: Colors.greenAccent,
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// class WavePainter extends CustomPainter {
//   final double progress;

//   WavePainter(this.progress);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final Paint paint = Paint()
//       ..color = Colors.greenAccent.withOpacity(1 - progress)
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 4.0;

//     final double maxRadius = min(size.width, size.height) * 0.4;

//     // canvas.drawLine(Offset, p2, paint)
//     var path = Path();
//     for (int i = -180; i <= 180; i++) {
//       path.lineTo(
//         i.toDouble() + size.width / 2,
//         -sin(i * 0.017) * size.height / 2 + size.height / 2,
//       );
//     }

//     canvas.drawPath(path, paint);
//     // Draw expanding circles
//     for (int i = 0; i < 3; i++) {
//       final double radius = maxRadius * (progress - (i * 0.33)).clamp(0.0, 1.0);
//       if (radius > 0) {
//         canvas.drawCircle(
//           size.center(Offset.zero),
//           radius,
//           paint..color = paint.color.withOpacity(1 - (progress - (i * 0.33))),
//         );
//       }
//     }
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
// }

// ignore_for_file: use_super_parameters, library_private_types_in_public_api, prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:auto_route/auto_route.dart';
import 'package:faith_mobile/core/routes/app_route.gr.dart';
import 'package:faith_mobile/widgets/hamburger_menu.dart';
import 'package:faith_mobile/widgets/paint/wave_painter2.dart';
import 'package:faith_mobile/widgets/paint/wave_painter3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:faith_mobile/widgets/paint/wave_painter.dart';

@RoutePage()
class CallScreen extends StatefulWidget {
  const CallScreen({Key? key}) : super(key: key);

  @override
  _CallScreenState createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3))
          ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          './assets/images/landing-bg.png', // Path to your SVG
          fit: BoxFit.cover, // Cover the entire container
        ),
        WaveAnimationWidgetOne(),
        WaveAnimationWidget(),
        WaveAnimationWidgetThree(),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 1.5 / 5,
            ),
            Text(
              'Call faith',
              style: TextStyle(
                fontSize: 35,
                color: Colors.white,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.bold,
                height: 0.945,
                fontFamily: 'Playfair',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              '00:23:57',
              style: TextStyle(
                  fontSize: 15,
                  color: Color(0xCCFFFFFF),
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w400,
                  height: 1.7,
                  fontFamily: 'Georgia'),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 32,
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(top: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        context.router.pop();
                      },
                      icon: Icon(Icons.arrow_back),
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all(Colors.transparent),
                        foregroundColor: WidgetStateProperty.all(Colors.white),
                      )),
                  HamburgerMenu()
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 52),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        this._controller.stop(canceled: true);
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(Color(0x1AFFFFFF)),
                          padding:
                              WidgetStateProperty.all(EdgeInsets.all(15.0))),
                      icon: SvgPicture.asset('assets/icons/endcall.svg')),
                  SizedBox(
                    width: 17,
                  ),
                  IconButton(
                      onPressed: () {
                        context.router.push(ChatScreen());
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(Color(0x1AFFFFFF)),
                          padding:
                              WidgetStateProperty.all(EdgeInsets.all(15.0))),
                      icon: SvgPicture.asset('assets/icons/message.svg')),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
