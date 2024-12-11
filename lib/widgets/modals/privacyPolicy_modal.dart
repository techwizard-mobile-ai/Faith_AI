// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, library_private_types_in_public_api, use_super_parameters, prefer_const_literals_to_create_immutables, void_checks

import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:faith_mobile/utils/pop.dart';

@RoutePage()
class PrivacyPolicyModal extends StatefulWidget {
  const PrivacyPolicyModal({Key? key}) : super(key: key);

  @override
  _PrivacyPolicyModalState createState() => _PrivacyPolicyModalState();
}

class _PrivacyPolicyModalState extends State<PrivacyPolicyModal> {
  bool _isMenuOpen = false;
  Map<dynamic, dynamic> _menuItems = POP.pop[0];

  void _toggleMenu() {
    setState(() {
      _isMenuOpen = !_isMenuOpen;
    });
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
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.arrow_back),
                              style: ButtonStyle(
                                backgroundColor:
                                    WidgetStateProperty.all(Colors.transparent),
                                foregroundColor:
                                    WidgetStateProperty.all(Colors.white),
                              )),
                          IconButton(
                              onPressed: () {
                                _toggleMenu();
                              },
                              icon: Icon(Icons.menu_book_outlined),
                              style: ButtonStyle(
                                backgroundColor:
                                    WidgetStateProperty.all(Colors.transparent),
                                foregroundColor:
                                    WidgetStateProperty.all(Colors.white),
                              )),
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
                                'Privacy Policy',
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
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(top: 10, bottom: 10),
                                  padding: EdgeInsets.all(14),
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.1),
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          this._menuItems['title'],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              height: 1.5,
                                              fontFamily: 'Georgia'),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          this._menuItems['subtitle'],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              height: 1.5,
                                              fontFamily: 'Georgia'),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(this._menuItems['content'],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                                height: 1.2,
                                                fontFamily: 'Georgia')),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Row(
                        //   children: [
                        //     Expanded(
                        //       child:  )
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    width: this._isMenuOpen
                        ? MediaQuery.of(context).size.width
                        : 0,
                    decoration: BoxDecoration(
                        color:
                            Color.fromARGB(255, 70, 16, 54).withOpacity(0.3)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: ClipRRect(
                              child: BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            this._toggleMenu();
                                          },
                                          icon: Icon(
                                            Icons.arrow_forward,
                                            color: Colors.white,
                                          )),
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: POP.pop.map((item) {
                                            if (item['h1']) {
                                              return HeaderMenuItem(
                                                title: item['title'],
                                                selecteItem: item,
                                                onClick: (_item) {
                                                  if (_item['content'] !=
                                                      null) {
                                                    setState(() {
                                                      _menuItems = {
                                                        'title': _item['title'],
                                                        'subtitle': '',
                                                        'content':
                                                            _item['content']
                                                      };
                                                    });
                                                    this._toggleMenu();
                                                  }
                                                },
                                              );
                                            } else {
                                              return SubHeaderItem(
                                                  title: item['subtitle'],
                                                  selecteItem: item,
                                                  onClick: (_item) {
                                                    if (_item['content'] !=
                                                        null) {
                                                      setState(() {
                                                        _menuItems = {
                                                          'title':
                                                              _item['title'],
                                                          'subtitle':
                                                              _item['subtitle'],
                                                          'content':
                                                              _item['content']
                                                        };
                                                      });
                                                      this._toggleMenu();
                                                    }
                                                  });
                                            }
                                          }).toList())
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class HeaderMenuItem extends StatelessWidget {
  final String title;
  Map<dynamic, dynamic>? selecteItem;
  Function(Map<dynamic, dynamic> item)? onClick;
  HeaderMenuItem(
      {super.key, required this.title, this.selecteItem, this.onClick});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        )),
        onPressed: () {
          onClick!(selecteItem!);
        },
        child: Text(
            softWrap: false,
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.white,
                overflow: TextOverflow.ellipsis,
                fontSize: 17,
                fontFamily: 'Georgia'),
            this.title));
  }
}

class SubHeaderItem extends StatelessWidget {
  final String title;
  Map<dynamic, dynamic>? selecteItem;
  Function(Map<dynamic, dynamic> item)? onClick;
  SubHeaderItem(
      {super.key, required this.title, this.selecteItem, this.onClick});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
            padding: EdgeInsets.only(left: 20, right: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            )),
        onPressed: () {
          onClick!(selecteItem!);
        },
        child: Text(
            softWrap: false,
            style: TextStyle(
                color: Colors.white,
                overflow: TextOverflow.ellipsis,
                fontSize: 15,
                fontFamily: 'Georgia'),
            this.title));
  }
}
