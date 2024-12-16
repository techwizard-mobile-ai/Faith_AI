// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:myfriendfaith/core/routes/app_route.gr.dart';

@RoutePage()
class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

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
                SizedBox(height: 100),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          context.router.push(SwipperScreen());
                        },
                        child: SizedBox(
                          height: 50,
                          child: Center(
                            child: Text('Meet Faith',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Georgia')),
                          ),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Color(0x1AFFFFFF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10.0), // Set the border radius here
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 20, right: 20, bottom: 25, top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?',
                        style: TextStyle(
                            color: Color(0xB2FFFFFF),
                            fontSize: 14,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Georgia')),
                    TextButton(
                        onPressed: () {
                          context.router.push(LoginScreen());
                        },
                        child: Text('Login',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Georgia')))
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
