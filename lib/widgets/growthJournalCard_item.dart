// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class GrowthJournalCardItem extends StatelessWidget {
  const GrowthJournalCardItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Reflect',
          style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              height: 1.08,
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.none,
              fontFamily: 'Playfair'),
        ),
        Text(
          '87% complete',
          style: TextStyle(
              color: Color(0xB2FFFFFF),
              fontSize: 14,
              height: 1.79,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.none,
              fontFamily: 'Georgia'),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          'The Reflect path invites you to pause, look inward, and discover the clarity that lies within. Like a serene river or a still lake, this journey encourages mindfulness, and gentle introspection.\n As you travel this path, Faith will guide you through moments of stillness and contemplation, helping you uncover the truths and lessons hidden in your everyday experiences.',
          style: TextStyle(
              color: Color(0xE5FFFFFF),
              fontSize: 15,
              height: 1.33,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.none,
              fontFamily: 'Georgia'),
        ),
      ],
    );
  }
}
