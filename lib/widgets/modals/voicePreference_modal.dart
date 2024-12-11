// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, library_private_types_in_public_api, use_super_parameters, prefer_const_literals_to_create_immutables

import 'package:auto_route/auto_route.dart';
import 'package:faith_mobile/widgets/aiFriend_item.dart';
import 'package:faith_mobile/widgets/modals/profile_modal.dart';
import 'package:flutter/material.dart';
import 'package:faith_mobile/widgets/modals/about_modal.dart';

@RoutePage()
class VoicePreferenceModal extends StatefulWidget {
  const VoicePreferenceModal({Key? key}) : super(key: key);

  @override
  _VoicePreferenceModalState createState() => _VoicePreferenceModalState();
}

class _VoicePreferenceModalState extends State<VoicePreferenceModal> {
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
                    child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Voice Settings',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Playfair',
                                  fontWeight: FontWeight.bold,
                                  height: 1.7,
                                  fontSize: 30),
                            ),
                          ],
                        ),
                        AiFriendItem(),
                        AiFriendItem(),
                        AiFriendItem(),
                        AiFriendItem(),
                        AiFriendItem(),
                        AiFriendItem(),
                        AiFriendItem(),
                        AiFriendItem(),
                        AiFriendItem(),
                      ],
                    ),
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
