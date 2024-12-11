// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, library_private_types_in_public_api, use_super_parameters, prefer_const_literals_to_create_immutables, prefer_if_null_operators

import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class PrayerExperienceModal extends StatefulWidget {
  const PrayerExperienceModal({Key? key}) : super(key: key);

  @override
  _PrayerExperienceModalState createState() => _PrayerExperienceModalState();
}

class _PrayerExperienceModalState extends State<PrayerExperienceModal> {
  bool openModal = false;
  String? _selectedPath;
  final TextEditingController _openingController = TextEditingController();
  final TextEditingController _closingController = TextEditingController();

  @override
  initState() {
    super.initState();
    _openingController.text = "Dear God";
    _closingController.text = "Amen";
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
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.check),
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
                  margin: EdgeInsets.only(bottom: 150),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 15, left: 10),
                            child: Text(
                              'Prayer Experience',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Playfair',
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
                              padding: EdgeInsets.symmetric(
                                  horizontal: 17, vertical: 8),
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.1),
                                  shape: BoxShape.rectangle,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                      bottom: BorderSide(
                                          color: Colors.white.withOpacity(0.3),
                                          width: 1),
                                    )),
                                    child: TextButton(
                                        onPressed: () {
                                          setState(() {
                                            openModal = true;
                                          });
                                        },
                                        style: TextButton.styleFrom(
                                            padding: EdgeInsets.only(
                                                top: 0,
                                                left: 0,
                                                right: 0,
                                                bottom: 0),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5))),
                                        child: Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                _selectedPath == null
                                                    ? 'Choose Path'
                                                    : _selectedPath!
                                                        .toUpperCase(),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'Georgia',
                                                    fontSize: 14),
                                              ),
                                              Icon(
                                                size: 17,
                                                Icons.arrow_forward_ios_rounded,
                                                color: Colors.white
                                                    .withOpacity(0.2),
                                              )
                                            ],
                                          ),
                                        )),
                                  ),
                                  Container(
                                      decoration: BoxDecoration(
                                          border: Border(
                                        bottom: BorderSide(
                                            color:
                                                Colors.white.withOpacity(0.3),
                                            width: 1),
                                      )),
                                      child: TextField(
                                          controller: _openingController,
                                          style: TextStyle(color: Colors.white),
                                          cursorColor: Colors.white,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10),
                                            hintText: 'Opening Address',
                                            hintStyle: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.8),
                                                fontFamily: 'Georgia',
                                                height: 1.741,
                                                fontSize: 14),
                                            border: InputBorder.none,
                                          ))),
                                  Container(
                                      child: TextField(
                                          controller: _closingController,
                                          style: TextStyle(color: Colors.white),
                                          cursorColor: Colors.white,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10),
                                            hintText: 'Closing Address',
                                            hintStyle: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.8),
                                                fontFamily: 'Georgia',
                                                height: 1.741,
                                                fontSize: 14),
                                            border: InputBorder.none,
                                          ))),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ))
              ],
            ),
            openModal
                ? Center(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 50),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    openModal = false;
                                    _selectedPath = 'prayer';
                                  });
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 10),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(0)),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Text(
                                      'Prayer',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontFamily: 'Georgia'),
                                    )
                                  ],
                                )),
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    openModal = false;
                                    _selectedPath = 'meditation';
                                  });
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 10),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(0)),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Text(
                                      'Meditation',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontFamily: 'Georgia'),
                                    )
                                  ],
                                )),
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    openModal = false;
                                    _selectedPath = 'both';
                                  });
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 10),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(0)),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Text(
                                      'Both',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontFamily: 'Georgia'),
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
                  )
                : SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
