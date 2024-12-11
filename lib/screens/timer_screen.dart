// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, sort_child_properties_last

import 'package:auto_route/auto_route.dart';
import 'package:faith_mobile/core/routes/app_route.gr.dart';
import 'package:faith_mobile/widgets/coutdown_clock.dart';
import 'package:faith_mobile/widgets/hamburger_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class TimerScreen extends StatefulWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          './assets/images/landing-bg.png', // Path to your SVG
          fit: BoxFit.cover, // Cover the entire container
        ),
        Center(
            child: Padding(
          padding: const EdgeInsets.all(46),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Meditate',
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w400,
                    height: 0.914,
                    fontFamily: 'Playfair',
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'It\'s time to breath...',
                  style: TextStyle(
                      fontSize: 15,
                      color: Color(0xCCFFFFFF),
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w400,
                      height: 1.3,
                      fontFamily: 'Georgia'),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 357.3,
                ),
              ]),
        )),
        Center(
            child: Container(
                margin: EdgeInsets.only(top: 32), child: CountdownClock())),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(top: 42),
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
                child: TextButton(
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 40),
                      child: Text('End',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400)),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0x1AFFFFFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )))
          ],
        )
      ],
    );
  }
}
