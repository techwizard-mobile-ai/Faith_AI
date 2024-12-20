// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ChatItem extends StatefulWidget {
  final bool isBot;
  final List<dynamic> messages;
  const ChatItem({Key? key, required this.isBot, required this.messages})
      : super(key: key);

  @override
  _ChatItemState createState() => _ChatItemState();
}

class _ChatItemState extends State<ChatItem> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  List<TextSpan> _parseText(String input) {
    final List<TextSpan> spans = [];
    final regex = RegExp(r'\*(.*?)\*'); // Match text between * and *
    int start = 0;

    for (final match in regex.allMatches(input)) {
      // Add normal text before the match
      if (match.start > start) {
        spans.add(TextSpan(
          text: input.substring(start, match.start),
        ));
      }

      // Add bold text
      spans.add(TextSpan(
        text: match.group(1), // Extract content inside *
        style: const TextStyle(fontWeight: FontWeight.w900),
      ));

      start = match.end; // Move the start to the end of the match
    }

    // Add any remaining normal text
    if (start < input.length) {
      spans.add(TextSpan(
        text: input.substring(start),
      ));
    }

    return spans;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment:
              widget.isBot ? MainAxisAlignment.start : MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.isBot
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
              children: widget.messages.map((msg) {
                final spans = _parseText(msg);
                return Container(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.6),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    margin: EdgeInsets.only(bottom: 7),
                    decoration: BoxDecoration(
                      color: Color(widget.isBot ? 0x1AFFFFFF : 0x59F0C579),
                      borderRadius: BorderRadius.only(
                        topRight:
                            widget.isBot ? Radius.circular(15) : Radius.zero,
                        topLeft:
                            widget.isBot ? Radius.zero : Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                    child: RichText(
                        text: TextSpan(
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFFFFFFFF),
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              fontFamily: 'Georgia',
                            ),
                            children: spans)));
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
