import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myfriendfaith/core/call/index.dart';
import 'package:myfriendfaith/core/call/stt.dart';
import 'package:myfriendfaith/core/routes/app_route.gr.dart';
import 'package:myfriendfaith/widgets/hamburger_menu.dart';
import 'package:myfriendfaith/widgets/paint/wave_painter2.dart';
import 'package:myfriendfaith/widgets/paint/wave_painter3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myfriendfaith/widgets/paint/wave_painter.dart';

import 'package:audioplayers/audioplayers.dart';

@RoutePage()
class CallScreen extends StatefulWidget {
  const CallScreen({Key? key}) : super(key: key);

  @override
  _CallScreenState createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isBotSaying = false;
  final AudioPlayer _audioPlayer = AudioPlayer();
  String? historyId;
  final User? user = FirebaseAuth.instance.currentUser;
  late CustomSTT sttCore;

  void setBotSaying() {
    setState(() {
      _isBotSaying = !_isBotSaying;
    });
  }

  Future<void> sayToBot(String message) async {
    final audioStream = await callToBot(message, historyId, user!.uid);
    await _audioPlayer.setSourceBytes(audioStream);
    await _audioPlayer.resume();
    setBotSaying();
  }

  @override
  initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3))
          ..repeat(reverse: true);
    _audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        _isBotSaying = false;
      });
    });
    sttCore = CustomSTT(setBotSaying, sayToBot);
    sttCore.startRecording();
  }

  @override
  void dispose() {
    _controller.dispose();
    sttCore.stopRecording();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          './assets/images/landing-bg.png', // Path to your SVG
          fit: BoxFit.cover, // Cover the entire container
        ),
        WaveAnimationWidgetOne(
          botSaying: _isBotSaying,
        ),
        WaveAnimationWidget(
          botSaying: _isBotSaying,
        ),
        WaveAnimationWidgetThree(
          botSaying: _isBotSaying,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 1.5 / 5,
            ),
            Text(
              'Call faith',
              style: TextStyle(
                fontSize: 35,
                color: Colors.white,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.bold,
                height: 0.945,
                fontFamily: 'Playfair',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              '00:23:57',
              style: TextStyle(
                  fontSize: 15,
                  color: Color(0xCCFFFFFF),
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w400,
                  height: 1.7,
                  fontFamily: 'Georgia'),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 32,
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
            Container(
              margin: EdgeInsets.only(bottom: 52),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(Color(0x1AFFFFFF)),
                          padding:
                              WidgetStateProperty.all(EdgeInsets.all(15.0))),
                      icon: SvgPicture.asset('assets/icons/endcall.svg')),
                  SizedBox(
                    width: 17,
                  ),
                  IconButton(
                      onPressed: () {
                        context.router.push(ChatScreen(historyId: null));
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(Color(0x1AFFFFFF)),
                          padding:
                              WidgetStateProperty.all(EdgeInsets.all(15.0))),
                      icon: SvgPicture.asset('assets/icons/message.svg')),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
