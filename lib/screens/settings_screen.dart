// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, library_private_types_in_public_api, use_super_parameters, prefer_const_literals_to_create_immutables

import 'package:auto_route/auto_route.dart';
import 'package:faith_mobile/widgets/hamburger_menu.dart';
import 'package:faith_mobile/widgets/modals/prayerExperience_modal.dart';
import 'package:faith_mobile/widgets/modals/privacyPolicy_modal.dart';
import 'package:faith_mobile/widgets/modals/profile_modal.dart';
import 'package:faith_mobile/widgets/modals/voicePreference_modal.dart';
import 'package:faith_mobile/widgets/modals/tos_modal.dart';
import 'package:flutter/material.dart';
import 'package:faith_mobile/widgets/modals/about_modal.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
            Container(
              margin: EdgeInsets.only(top: 70),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Settings',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Playfair',
                                  fontWeight: FontWeight.bold,
                                  height: 1.7,
                                  fontSize: 30),
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
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 10),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.asset(
                                        'assets/icons/google-icon.png',
                                        height: 55,
                                        width: 55,
                                      ),
                                    ),
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Helena Greene',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Georgia',
                                              height: 1.741,
                                              fontSize: 14),
                                        ),
                                        Text(
                                          'helena.greene@gmail.com',
                                          style: TextStyle(
                                              color:
                                                  Colors.white.withOpacity(0.8),
                                              fontFamily: 'Georgia',
                                              height: 1.741,
                                              fontSize: 14),
                                        )
                                      ],
                                    )),
                                    IconButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  ProfileModal());
                                        },
                                        iconSize: 17,
                                        icon: Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: Colors.white.withOpacity(0.2),
                                        ))
                                  ],
                                ),
                              ),
                            )
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
                                      decoration: BoxDecoration(
                                          border: Border(
                                        bottom: BorderSide(
                                            color:
                                                Colors.white.withOpacity(0.3),
                                            width: 1),
                                      )),
                                      child: TextButton(
                                          onPressed: () {},
                                          style: TextButton.styleFrom(
                                              padding: EdgeInsets.only(
                                                  top: 10,
                                                  bottom: 10,
                                                  left: 0,
                                                  right: 0),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                          child: Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Faith Name',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily: 'Georgia',
                                                      height: 1.741,
                                                      fontSize: 14),
                                                ),
                                                Text(
                                                  'Faith',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                      fontFamily: 'Georgia',
                                                      height: 1.741,
                                                      fontSize: 14),
                                                ),
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
                                      child: TextButton(
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    VoicePreferenceModal());
                                          },
                                          style: TextButton.styleFrom(
                                              padding: EdgeInsets.only(
                                                  top: 6,
                                                  bottom: 6,
                                                  left: 0,
                                                  right: 0),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                          child: Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Voice Preference',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily: 'Georgia',
                                                      height: 1.741,
                                                      fontSize: 14),
                                                ),
                                                Icon(
                                                  size: 17,
                                                  Icons
                                                      .arrow_forward_ios_rounded,
                                                  color: Colors.white
                                                      .withOpacity(0.2),
                                                )
                                              ],
                                            ),
                                          )),
                                    ),
                                    Container(
                                      child: TextButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  PrayerExperienceModal(),
                                            );
                                          },
                                          style: TextButton.styleFrom(
                                              padding: EdgeInsets.only(
                                                  top: 0,
                                                  left: 0,
                                                  right: 0,
                                                  bottom: 0),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                          child: Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Prayer Experience',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily: 'Georgia',
                                                      fontSize: 14),
                                                ),
                                                Icon(
                                                  size: 17,
                                                  Icons
                                                      .arrow_forward_ios_rounded,
                                                  color: Colors.white
                                                      .withOpacity(0.2),
                                                )
                                              ],
                                            ),
                                          )),
                                    )
                                  ],
                                ),
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
                                      decoration: BoxDecoration(
                                          border: Border(
                                        bottom: BorderSide(
                                            color:
                                                Colors.white.withOpacity(0.3),
                                            width: 1),
                                      )),
                                      child: TextButton(
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AboutModal());
                                          },
                                          style: TextButton.styleFrom(
                                              padding: EdgeInsets.only(
                                                  top: 0,
                                                  left: 0,
                                                  right: 0,
                                                  bottom: 0),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                          child: Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'About Faith AI',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily: 'Georgia',
                                                      fontSize: 14),
                                                ),
                                                Icon(
                                                  size: 17,
                                                  Icons
                                                      .arrow_forward_ios_rounded,
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
                                      child: TextButton(
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    PrivacyPolicyModal());
                                          },
                                          style: TextButton.styleFrom(
                                              padding: EdgeInsets.only(
                                                  top: 6,
                                                  bottom: 6,
                                                  left: 0,
                                                  right: 0),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                          child: Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Privacy Policy',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily: 'Georgia',
                                                      height: 1.741,
                                                      fontSize: 14),
                                                ),
                                                Icon(
                                                  size: 17,
                                                  Icons
                                                      .arrow_forward_ios_rounded,
                                                  color: Colors.white
                                                      .withOpacity(0.2),
                                                )
                                              ],
                                            ),
                                          )),
                                    ),
                                    Container(
                                      child: TextButton(
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    TosModal());
                                          },
                                          style: TextButton.styleFrom(
                                              padding: EdgeInsets.only(
                                                  top: 0,
                                                  left: 0,
                                                  right: 0,
                                                  bottom: 0),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                          child: Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Terms of Service',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily: 'Georgia',
                                                      fontSize: 14),
                                                ),
                                                Icon(
                                                  size: 17,
                                                  Icons
                                                      .arrow_forward_ios_rounded,
                                                  color: Colors.white
                                                      .withOpacity(0.2),
                                                )
                                              ],
                                            ),
                                          )),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                              margin: EdgeInsets.only(top: 12),
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                    padding: EdgeInsets.symmetric(vertical: 13),
                                    backgroundColor:
                                        Colors.white.withOpacity(0.1),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                child: Text(
                                  'Log Out',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Georgia',
                                      height: 1.741,
                                      fontSize: 14),
                                ),
                              ),
                            )),
                          ],
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 32),
              child: Column(
                children: [
                  Row(
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
