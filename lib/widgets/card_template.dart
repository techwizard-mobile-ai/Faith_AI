// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, prefer_const_literals_to_create_immutables

import 'package:myfriendfaith/widgets/journal_item.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CardTemplate extends StatefulWidget {
  final int index;
  final List<Map<String, dynamic>> journal;
  final String title;
  void Function(int) openModal;
  CardTemplate(
      {Key? key,
      required this.index,
      required this.openModal,
      required this.journal,
      required this.title})
      : super(key: key);

  @override
  _CardTemplateState createState() => _CardTemplateState();
}

class _CardTemplateState extends State<CardTemplate> {
  final GlobalKey _stackKey = GlobalKey();
  // int activeIndex = 0;

  // void handleShowModal(int index) {
  //   setState(() {
  //     if (activeIndex == index) {
  //       activeIndex = 0;
  //     } else {
  //       activeIndex = index;
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 28),
      constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          minWidth: MediaQuery.of(context).size.width),
      child: Stack(clipBehavior: Clip.none, children: [
        Column(
          key: _stackKey,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 8),
              child: Text(this.widget.title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w400,
                      height: 1.2,
                      fontFamily: 'Georgia')),
            ),
            Column(
                children: widget.journal.asMap().entries.map((entry) {
              final document = entry.value;
              return JournalItem(
                stackKey: _stackKey,
                index: this.widget.index + entry.key + 1,
                openModal: (int index) {
                  this.widget.openModal(index);
                },
                data: document,
              );
            }).toList())
          ],
        ),
        // activeIndex > 0
        //     ? Positioned(
        //         top: activeIndex * 85 - 3,
        //         right: 12,
        //         child: Container(
        //           width: 141,
        //           decoration: BoxDecoration(
        //             color: Color(0xFFB18887),
        //             borderRadius: BorderRadius.all(Radius.circular(10)),
        //             boxShadow: [
        //               BoxShadow(
        //                 color: Colors.grey.withOpacity(0.8), // Shadow color
        //                 spreadRadius: 1, // Spread radius
        //                 blurRadius: 30, // Blur radius
        //                 offset:
        //                     Offset(8, 8), // Offset in X and Y (shadow position)
        //               ),
        //             ],
        //           ),
        //           child: Column(
        //             children: [
        //               TextButton(
        //                   onPressed: () {
        //                     print('object');
        //                   },
        //                   style: TextButton.styleFrom(
        //                     shape: RoundedRectangleBorder(
        //                       borderRadius:
        //                           BorderRadius.all(Radius.circular(0)),
        //                     ),
        //                   ),
        //                   child: Row(
        //                     children: [
        //                       SvgPicture.asset(
        //                         'assets/icons/share.svg',
        //                         width: 15,
        //                         height: 15,
        //                       ),
        //                       SizedBox(
        //                         width: 16,
        //                       ),
        //                       Text(
        //                         'Share',
        //                         style: TextStyle(
        //                             color: Colors.white,
        //                             fontSize: 14,
        //                             fontFamily: 'Georgia'),
        //                       )
        //                     ],
        //                   )),
        //               TextButton(
        //                   onPressed: () {
        //                     print('object');
        //                   },
        //                   style: TextButton.styleFrom(
        //                     shape: RoundedRectangleBorder(
        //                       borderRadius:
        //                           BorderRadius.all(Radius.circular(0)),
        //                     ),
        //                   ),
        //                   child: Row(
        //                     children: [
        //                       SvgPicture.asset(
        //                         'assets/icons/trash.svg',
        //                         width: 15,
        //                         height: 15,
        //                       ),
        //                       SizedBox(
        //                         width: 16,
        //                       ),
        //                       Text(
        //                         'Delete',
        //                         style: TextStyle(
        //                             color: Colors.white,
        //                             fontSize: 14,
        //                             fontFamily: 'Georgia'),
        //                       )
        //                     ],
        //                   )),
        //             ],
        //           ),
        //         ),
        //       )
        //     : SizedBox.shrink()
      ]),
    );
  }
}
