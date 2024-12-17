// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'dart:async';

class CurrentTime extends StatefulWidget {
  const CurrentTime({Key? key}) : super(key: key);

  @override
  _CurrentTimeState createState() => _CurrentTimeState();
}

class _CurrentTimeState extends State<CurrentTime> {
  Timer? _currentTimer;
  String? _current;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _currentTimer = Timer.periodic(Duration(minutes: 1), (timer) {
      DateTime now = DateTime.now();
      setState(() {
        _current =
            '${(now.hour % 12).toString()} : ${now.minute.toString()} ${now.hour / 12 >= 1 ? "PM" : "AM"}';
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _currentTimer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      this._current ?? '00:00',
      style: TextStyle(
          fontSize: 15,
          color: Color(0x99FFFFFF),
          decoration: TextDecoration.none,
          fontWeight: FontWeight.w400,
          height: 1.7,
          fontFamily: 'Georgia'),
      textAlign: TextAlign.center,
    );
  }
}
