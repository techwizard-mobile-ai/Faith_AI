// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, use_super_parameters, sort_child_properties_last

import 'package:auto_route/auto_route.dart';
import 'package:faith_mobile/core/routes/app_route.gr.dart';
import 'package:faith_mobile/widgets/card_template.dart';
import 'package:faith_mobile/widgets/chat_item.dart';
import 'package:faith_mobile/widgets/filter_item.dart';
import 'package:faith_mobile/widgets/hamburger_menu.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'dart:math';

@RoutePage()
class JournalScreen extends StatefulWidget {
  const JournalScreen({Key? key}) : super(key: key);

  @override
  _JournalScreenState createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  //Here is for the Modal flag
  int activeIndex = 0;

  //Here is the modal flag handler
  void handleModal(int index) {
    setState(() {
      if (activeIndex == index) {
        activeIndex = 0;
      } else {
        activeIndex = index;
      }
    });
    print((activeIndex / 5).floor());
  }

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 70),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 24, bottom: 13),
                            child: Text(
                              'Journal',
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.bold,
                                height: 1.07,
                                fontFamily: 'Playfair',
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                                margin: EdgeInsets.only(left: 15, right: 10),
                                child: TextField(
                                    decoration: InputDecoration(
                                        hintText: 'Type your message...',
                                        hintStyle: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xFFFFFFFF)
                                                .withOpacity(0.6)),
                                        filled: true,
                                        fillColor:
                                            Color(0xFFFFFFFF).withOpacity(0.1),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide.none,
                                        ),
                                        prefixIcon: Icon(
                                          Icons.search,
                                          color: Color(0xFFFFFFFF)
                                              .withOpacity(0.6),
                                        )),
                                    style: TextStyle(
                                        color:
                                            Color(0xFFFFFFFF).withOpacity(0.9),
                                        fontSize: 14))),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 15),
                            child: IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  'assets/icons/filter.svg',
                                  color: Color(0xFFFFFFFF).withOpacity(0.6),
                                ),
                                style: ButtonStyle(
                                  padding: WidgetStateProperty.all(
                                      EdgeInsets.all(15)),
                                  backgroundColor: WidgetStateProperty.all(
                                      Color(0x59F0C579)),
                                  foregroundColor:
                                      WidgetStateProperty.all(Colors.white),
                                  shape: WidgetStateProperty.all(
                                      RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  )),
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(left: 15, top: 17, bottom: 24),
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            FilterItem(
                              title: 'All Entries',
                              isSelect: true,
                              onClick: () {},
                            ),
                            FilterItem(
                              title: 'Gratitude',
                              isSelect: false,
                              onClick: () {},
                            ),
                            FilterItem(
                              title: 'Mindfulness',
                              isSelect: false,
                              onClick: () {},
                            ),
                            FilterItem(
                              title: 'Confidence',
                              isSelect: false,
                              onClick: () {},
                            ),
                          ],
                        ))),
                Expanded(
                    child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Stack(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CardTemplate(
                          index: 0,
                          openModal: this.handleModal,
                        ),
                        CardTemplate(
                          index: 5,
                          openModal: this.handleModal,
                        ),
                      ],
                    ),
                    activeIndex > 0
                        ? Positioned(
                            top: activeIndex == 10
                                ? activeIndex * 85 - 3
                                : activeIndex * 85 +
                                    ((activeIndex - 1) / 5).floor() * 58 -
                                    3,
                            right: 12,
                            child: Container(
                              width: 141,
                              decoration: BoxDecoration(
                                color: Color(0xFFB18887),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey
                                        .withOpacity(0.8), // Shadow color
                                    spreadRadius: 1, // Spread radius
                                    blurRadius: 30, // Blur radius
                                    offset: Offset(8,
                                        8), // Offset in X and Y (shadow position)
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        print('object');
                                      },
                                      style: TextButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(0)),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/icons/share.svg',
                                            width: 15,
                                            height: 15,
                                          ),
                                          SizedBox(
                                            width: 16,
                                          ),
                                          Text(
                                            'Share',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontFamily: 'Georgia'),
                                          )
                                        ],
                                      )),
                                  TextButton(
                                      onPressed: () {
                                        print('object');
                                      },
                                      style: TextButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(0)),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/icons/trash.svg',
                                            width: 15,
                                            height: 15,
                                          ),
                                          SizedBox(
                                            width: 16,
                                          ),
                                          Text(
                                            'Delete',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontFamily: 'Georgia'),
                                          )
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          )
                        : SizedBox.shrink()
                  ]),
                )),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            context.router.pop();
                          },
                          icon: Icon(Icons.arrow_back),
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStateProperty.all(Colors.transparent),
                            foregroundColor:
                                WidgetStateProperty.all(Colors.white),
                          )),
                    ],
                  ),
                  HamburgerMenu()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
