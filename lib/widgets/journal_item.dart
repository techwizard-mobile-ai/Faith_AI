// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:myfriendfaith/core/routes/app_route.gr.dart';

class JournalItem extends StatefulWidget {
  final GlobalKey stackKey;
  final int index;
  final Function(int) openModal;
  final Map<String, dynamic> data;
  JournalItem(
      {Key? key,
      required this.stackKey,
      required this.index,
      required this.openModal,
      required this.data})
      : super(key: key);

  @override
  _JournalItemState createState() => _JournalItemState();
}

class _JournalItemState extends State<JournalItem> {
  final GlobalKey _iconKey = GlobalKey();
  bool openModal = false;

  void handleChangeVisibilityofModal() {
    setState(() {
      openModal = !openModal;
    });
  }

  void _getButtonPosition() {
    // Get the RenderBox object of the IconButton
    final RenderBox renderBox =
        widget.stackKey.currentContext!.findRenderObject() as RenderBox;
    final Offset position = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;

    print('Position: $position'); // Top-left corner relative to the screen
    print(
        'Size: ${size.width} x ${size.height}'); // Width and height of the button
  }

  @override
  Widget build(BuildContext context) {
    print(widget.data);
    DateTime date = DateTime.fromMillisecondsSinceEpoch(
        widget.data['createdAt'].seconds * 1000);
    return Row(
      children: [
        Expanded(
            child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Material(
                color: Colors.transparent,
                child: InkResponse(
                  onTap: () {
                    context.router
                        .push(ChatScreen(historyId: widget.data['hid']));
                  },
                  splashColor:
                      Colors.white.withOpacity(0.1), // Custom splash color
                  highlightColor: Colors.transparent,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                    decoration: BoxDecoration(
                        color: Color(0x1AFFFFFF),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              this.widget.data['topic'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Georgia',
                                  height: 1.2),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                              date.toString(),
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                  fontSize: 13,
                                  fontFamily: 'Georgia',
                                  height: 1.47),
                            )
                          ],
                        )),
                        SizedBox(
                          height: 25,
                          width: 25,
                          child: IconButton(
                            key: _iconKey,
                            onPressed: () {
                              this.widget.openModal(this.widget.index);
                            },
                            icon: Icon(Icons.more_horiz),
                            style: IconButton.styleFrom(
                                iconSize: 13.5,
                                padding: EdgeInsets.all(0),
                                backgroundColor: Color(0x1AF5F5F5),
                                foregroundColor: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ))
      ],
    );
  }
}
