// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, sort_child_properties_last

import 'package:auto_route/auto_route.dart';
import 'package:myfriendfaith/core/routes/app_route.gr.dart';
import 'package:myfriendfaith/widgets/coutdown_clock.dart';
import 'package:myfriendfaith/widgets/growthJournalCard_item.dart';
import 'package:myfriendfaith/widgets/growth_canva.dart';
import 'package:myfriendfaith/widgets/hamburger_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class GrowthjournalScreen extends StatefulWidget {
  const GrowthjournalScreen({Key? key}) : super(key: key);

  @override
  _GrowthjournalScreenState createState() => _GrowthjournalScreenState();
}

class _GrowthjournalScreenState extends State<GrowthjournalScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          './assets/images/growth-bg.jpg', // Path to your SVG
          fit: BoxFit.cover, // Cover the entire container
        ),
        Container(
          margin: EdgeInsets.only(top: 70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 24, bottom: 13),
                            child: Text(
                              'Growth Journal',
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.w400,
                                height: 1.07,
                                fontFamily: 'Playfair',
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.6),
                            child: Text(
                              'Every step illuminates your path to peace and purpose.',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xCCFFFFFF),
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.w400,
                                  height: 1.43,
                                  fontFamily: 'Georgia'),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 40),
                              child: GrowthCanva()),
                          GrowthJournalCardItem()
                        ])),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                        margin:
                            EdgeInsets.only(bottom: 52, left: 15, right: 15),
                        child: TextButton(
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 40),
                              child: Text('Chat with Faith',
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
                            ))),
                  ),
                ],
              )
            ],
          ),
        ),
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
      ],
    );
  }
}
