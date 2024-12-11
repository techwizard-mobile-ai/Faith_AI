// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class AiFriendItem extends StatefulWidget {
  const AiFriendItem({Key? key}) : super(key: key);

  @override
  _AiFriendItemState createState() => _AiFriendItemState();
}

class _AiFriendItemState extends State<AiFriendItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(top: 10),
            child: TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.white.withOpacity(0.1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
              onPressed: () {},
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10, top: 10, bottom: 10),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.white.withOpacity(0.1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(
                                Icons.play_arrow_rounded,
                                color: Colors.white.withOpacity(0.8),
                              ),
                              Text(
                                'Play Sample Voice',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.8),
                                    fontSize: 12),
                              )
                            ],
                          ))
                    ],
                  )),
                  IconButton(
                      onPressed: null,
                      iconSize: 22,
                      icon: Icon(
                        Icons.star_border,
                        color: Colors.white.withOpacity(0.2),
                      ))
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
