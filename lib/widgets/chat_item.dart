// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  final bool isBot;
  final List<String> messages;
  const ChatItem({Key? key, required this.isBot, required this.messages})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment:
              isBot ? MainAxisAlignment.start : MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isBot
                ? Column(
                    children: [
                      Container(
                          padding: EdgeInsets.all(15),
                          margin: EdgeInsets.only(right: 10),
                          constraints: BoxConstraints(
                              maxWidth:
                                  MediaQuery.of(context).size.width * 0.2),
                          decoration: BoxDecoration(
                            color: Color(0x1AFFFFFF),
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            'F',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w400,
                              height: 2.65,
                              fontFamily: 'faith_font',
                            ),
                          )),
                    ],
                  )
                : SizedBox.shrink(),
            Column(
              children: messages.map((msg) {
                return Container(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.6),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    margin: EdgeInsets.only(bottom: 7),
                    decoration: BoxDecoration(
                      color: Color(isBot ? 0x1AFFFFFF : 0x59F0C579),
                      borderRadius: BorderRadius.only(
                        topRight: isBot ? Radius.circular(15) : Radius.zero,
                        topLeft: isBot ? Radius.zero : Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                    child: Text(
                      'I’ve been feeling a bit lost lately. I’m not sure what direction to take in life',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFFFFFFFF),
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                        fontFamily: 'Georgia',
                      ),
                      textAlign: TextAlign.start,
                    ));
              }).toList(),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
