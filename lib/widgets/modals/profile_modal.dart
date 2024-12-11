// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, library_private_types_in_public_api, use_super_parameters, prefer_const_literals_to_create_immutables

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:faith_mobile/widgets/modals/about_modal.dart';

@RoutePage()
class ProfileModal extends StatefulWidget {
  const ProfileModal({Key? key}) : super(key: key);

  @override
  _ProfileModalState createState() => _ProfileModalState();
}

class _ProfileModalState extends State<ProfileModal> {
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
                              'Profile',
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
                                        'Upload Customized Avatar',
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
                                      onPressed: () {},
                                      iconSize: 22,
                                      icon: Icon(
                                        Icons.file_upload_outlined,
                                        color: Colors.white.withOpacity(0.8),
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
                                      child: TextField(
                                          style: TextStyle(color: Colors.white),
                                          cursorColor: Colors.white,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10),
                                            hintText: 'Name',
                                            hintStyle: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.8),
                                                fontFamily: 'Georgia',
                                                height: 1.741,
                                                fontSize: 14),
                                            border: InputBorder.none,
                                          ))),
                                  Container(
                                      decoration: BoxDecoration(
                                          border: Border(
                                        bottom: BorderSide(
                                            color:
                                                Colors.white.withOpacity(0.3),
                                            width: 1),
                                      )),
                                      child: TextField(
                                          style: TextStyle(color: Colors.white),
                                          cursorColor: Colors.white,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10),
                                            hintText: 'Email',
                                            hintStyle: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.8),
                                                fontFamily: 'Georgia',
                                                height: 1.741,
                                                fontSize: 14),
                                            border: InputBorder.none,
                                          ))),
                                  Container(
                                      decoration: BoxDecoration(
                                          border: Border(
                                        bottom: BorderSide(
                                            color:
                                                Colors.white.withOpacity(0.3),
                                            width: 1),
                                      )),
                                      child: TextField(
                                          style: TextStyle(color: Colors.white),
                                          cursorColor: Colors.white,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10),
                                            hintText: 'Password',
                                            hintStyle: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.8),
                                                fontFamily: 'Georgia',
                                                height: 1.741,
                                                fontSize: 14),
                                            border: InputBorder.none,
                                          ))),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Checkbox(
                                        value: true,
                                        onChanged: (bool? value) {},
                                        activeColor:
                                            Colors.white.withOpacity(0.3),
                                        checkColor: Colors.white,
                                        side: BorderSide(
                                            color:
                                                Colors.white.withOpacity(0.3),
                                            width: 2),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                      ),
                                      TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            'I am Christian',
                                            style: TextStyle(
                                              color:
                                                  Colors.white.withOpacity(0.7),
                                              fontFamily: 'Georgia',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                            ),
                                          ))
                                    ],
                                  ),
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
            )
          ],
        ),
      ),
    );
  }
}
