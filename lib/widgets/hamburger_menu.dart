// ignore_for_file: prefer_const_constructors

import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:myfriendfaith/core/routes/app_route.gr.dart";

class HamburgerMenu extends StatefulWidget {
  const HamburgerMenu({super.key});

  @override
  _HamburgerMenuState createState() => _HamburgerMenuState();
}

class _HamburgerMenuState extends State<HamburgerMenu> {
  bool _isOpen = false;

  void toggleMenu() {
    setState(() {
      _isOpen = !_isOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      decoration: BoxDecoration(
          color: _isOpen ? Colors.white.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
      constraints: BoxConstraints(
        maxHeight: 240,
      ),
      child: Column(
        children: [
          IconButton(
              onPressed: () {
                toggleMenu();
              },
              icon: _isOpen
                  ? Icon(
                      Icons.close_outlined,
                      size: 13,
                    )
                  : Icon(Icons.menu),
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.transparent),
                foregroundColor: WidgetStateProperty.all(Colors.white),
              )),
          _isOpen
              ? Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          if (context.router.currentPath == "/journal") return;
                          context.router.push(JournalScreen());
                          setState(() {
                            _isOpen = false;
                          });
                        },
                        icon: Icon(
                          Icons.playlist_add_check_outlined,
                          size: 20,
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(Colors.transparent),
                          foregroundColor:
                              WidgetStateProperty.all(Colors.white),
                        )),
                    IconButton(
                        onPressed: () {
                          if (context.router.currentPath == "/growthjournal")
                            return;
                          context.router.push(GrowthjournalScreen());
                          setState(() {
                            _isOpen = false;
                          });
                        },
                        icon: Icon(
                          Icons.line_axis,
                          size: 20,
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(Colors.transparent),
                          foregroundColor:
                              WidgetStateProperty.all(Colors.white),
                        )),
                    IconButton(
                        onPressed: () {
                          if (context.router.currentPath == "/timer") return;
                          context.router.push(TimerScreen());
                          setState(() {
                            _isOpen = false;
                          });
                        },
                        icon: Icon(
                          Icons.watch_later_outlined,
                          size: 20,
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(Colors.transparent),
                          foregroundColor:
                              WidgetStateProperty.all(Colors.white),
                        )),
                    IconButton(
                        onPressed: () {
                          if (context.router.currentPath == "/settings") return;
                          context.router.push(SettingsScreen());
                          setState(() {
                            _isOpen = false;
                          });
                        },
                        icon: Icon(
                          Icons.settings,
                          size: 20,
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(Colors.transparent),
                          foregroundColor:
                              WidgetStateProperty.all(Colors.white),
                        )),
                  ],
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
