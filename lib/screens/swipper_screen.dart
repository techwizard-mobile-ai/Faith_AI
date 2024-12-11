// ignore_for_file: use_super_parameters, library_private_types_in_public_api, prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:auto_route/auto_route.dart';
import 'package:faith_mobile/core/routes/app_route.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SwipperScreen extends StatefulWidget {
  const SwipperScreen({Key? key}) : super(key: key);

  @override
  _SwipperScreenState createState() => _SwipperScreenState();
}

class _SwipperScreenState extends State<SwipperScreen>
    with SingleTickerProviderStateMixin {
  int index = 0;
  late AnimationController _controller;
  late Animation<Offset> _animation;

  void nextSlide(bool forward) {
    setState(() {
      if (forward) {
        index = index + 1;
      } else {
        index = index - 1;
      }
      if (index >= 3) {
        index = 0;
      } else if (index < 0) {
        index = 2;
      }
      _controller.forward(from: 0);
    });
  }

  void selectSlide(int _index) {
    setState(() {
      this.index = _index;
      _controller.forward(from: 0);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _animation = Tween<Offset>(
      begin: Offset(-2, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the controller when done
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          './assets/images/swipper-bg.png', // Path to your SVG
          fit: BoxFit.cover, // Cover the entire container
        ),
        Center(
            child: Padding(
          padding: const EdgeInsets.all(46),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SlideTransition(
                position: _animation,
                child: index == 0
                    ? Column(
                        children: [
                          SizedBox(
                            height: 120,
                          ),
                          Text(
                            'Welcome to Faith: Your Spiritual Companion',
                            style: TextStyle(
                                fontSize: 26,
                                color: Colors.white,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.w700,
                                height: 1.08,
                                fontFamily: 'Georgia'),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Faith guides you on a journey of spiritual growth through meaningful conversations and moments of reflection.',
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
                      )
                    : index == 1
                        ? Column(
                            children: [
                              SizedBox(
                                height: 120,
                              ),
                              Text(
                                'Welcome to Faith: Your Spiritual Companion',
                                style: TextStyle(
                                    fontSize: 26,
                                    color: Colors.white,
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.w700,
                                    height: 1.08,
                                    fontFamily: 'Georgia'),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Have people pick a pathway (Christian Wisdom or Universal Wisdom)',
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
                          )
                        : Column(
                            children: [
                              SizedBox(
                                height: 120,
                              ),
                              Text(
                                'Welcome to Faith: Your Spiritual Companion',
                                style: TextStyle(
                                    fontSize: 26,
                                    color: Colors.white,
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.w700,
                                    height: 1.08,
                                    fontFamily: 'Georgia'),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Show them how to use the app (make a phone call, make a message, go to journal, settings)',
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
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 7),
                    child: Center(
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        height: 6,
                        width: index == 0 ? 18 : 12,
                        child: TextButton(
                            onPressed: () {
                              // Handle button press
                              selectSlide(0);
                            },
                            child: Text(' '),
                            style: TextButton.styleFrom(
                              backgroundColor: index == 0
                                  ? Color(0xFFFFFFFF)
                                  : Color(0x33FFFFFF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            )),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 7),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      height: 6,
                      width: index == 1 ? 18 : 12,
                      child: TextButton(
                          onPressed: () {
                            // Handle button press
                            selectSlide(1);
                          },
                          child: Text(' '),
                          style: TextButton.styleFrom(
                            backgroundColor: index == 1
                                ? Color(0xFFFFFFFF)
                                : Color(0x33FFFFFF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          )),
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    height: 6,
                    width: index == 2 ? 18 : 12,
                    child: TextButton(
                        onPressed: () {
                          // Handle button press
                          selectSlide(2);
                        },
                        child: Text(' '),
                        style: TextButton.styleFrom(
                          backgroundColor: index == 2
                              ? Color(0xFFFFFFFF)
                              : Color(0x33FFFFFF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        )),
                  ),
                ],
              )
            ],
          ),
        )),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(top: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        context.router.push(DashboardScreen());
                      },
                      child: Text('Skip',
                          style: TextStyle(
                              color: Color(0x99FFFFFF),
                              fontSize: 14,
                              fontWeight: FontWeight.w400))),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 52),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      child: TextButton(
                          onPressed: () {
                            nextSlide(true);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 40),
                            child: Text('Next',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold)),
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: Color(0x1AFFFFFF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          )))
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
