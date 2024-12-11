// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:auto_route/auto_route.dart';
import 'package:faith_mobile/widgets/hamburger_menu.dart';
import 'package:flutter/material.dart';
import 'package:faith_mobile/core/routes/app_route.gr.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            './assets/images/landing-bg.png', // Path to your SVG
            fit: BoxFit.cover, // Cover the entire container
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'faith',
                  style: TextStyle(
                    fontFamily: 'faith_font',
                    color: Colors.white,
                    fontSize: 50,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w100,
                    height: 2.644,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(2.0, 2.0), // x, y offset
                        blurRadius: 10.0, // How blurred is the shadow
                        color: Color(0xF6D59DB0), // Shadow color
                      ),
                    ],
                  ),
                ),
                Text('Your guide to inner peace and growth',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w400,
                        height: 1.136,
                        fontFamily: 'Georgia')),
                Container(
                  margin: EdgeInsets.only(top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            context.router.push(ChatScreen());
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  WidgetStateProperty.all(Color(0x1AFFFFFF)),
                              padding: WidgetStateProperty.all(
                                  EdgeInsets.all(15.0))),
                          icon: SvgPicture.asset('assets/icons/message.svg')),
                      SizedBox(
                        width: 17,
                      ),
                      IconButton(
                          onPressed: () {
                            context.router.push(CallScreen());
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  WidgetStateProperty.all(Color(0x1AFFFFFF)),
                              padding: WidgetStateProperty.all(
                                  EdgeInsets.all(15.0))),
                          icon: SvgPicture.asset('assets/icons/call.svg'))
                    ],
                  ),
                )
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          context.router.push(ProfileModal());
                        },
                        icon: Icon(Icons.account_circle_outlined),
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(Colors.transparent),
                          foregroundColor:
                              WidgetStateProperty.all(Colors.white),
                        )),
                    HamburgerMenu()
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
