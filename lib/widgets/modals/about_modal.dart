// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, library_private_types_in_public_api, use_super_parameters, prefer_const_literals_to_create_immutables

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:myfriendfaith/widgets/modals/about_modal.dart';

@RoutePage()
class AboutModal extends StatefulWidget {
  const AboutModal({Key? key}) : super(key: key);

  @override
  _AboutModalState createState() => _AboutModalState();
}

class _AboutModalState extends State<AboutModal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              './assets/images/landing-bg.png', // Path to your SVG
              fit: BoxFit.cover, // Cover the entire container
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 32),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(Icons.arrow_back),
                                  style: ButtonStyle(
                                    backgroundColor: WidgetStateProperty.all(
                                        Colors.transparent),
                                    foregroundColor:
                                        WidgetStateProperty.all(Colors.white),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            margin:
                                EdgeInsets.only(top: 5, bottom: 5, left: 10),
                            child: Text(
                              'Faith AI',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Georgia',
                                  fontWeight: FontWeight.bold,
                                  height: 1.7,
                                  fontSize: 30),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                                margin: EdgeInsets.only(top: 10),
                                padding: EdgeInsets.all(14),
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.1),
                                    shape: BoxShape.rectangle,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Text(
                                  'My Friend Faith is your trusted spiritual companion, offering personalized guidance through life’s journey. Combining timeless wisdom with innovative AI technology, we help you apply sacred teachings to modern life. Available 24/7, we provide a judgment-free space for exploration, growth, and support. My Friend Faith is designed to complement, not replace, your existing faith community.',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      height: 1.5,
                                      fontFamily: 'Georgia'),
                                )),
                          )
                        ],
                      ),
                    ],
                  ),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
