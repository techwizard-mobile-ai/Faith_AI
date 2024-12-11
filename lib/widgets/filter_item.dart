// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';

class FilterItem extends StatefulWidget {
  final String title;
  final bool isSelect;
  Function? onClick;
  FilterItem(
      {Key? key,
      required this.title,
      required this.isSelect,
      this.onClick = null})
      : super(key: key);

  @override
  _FilterItemState createState() => _FilterItemState();
}

class _FilterItemState extends State<FilterItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: TextButton(
          onPressed: () {
            widget.onClick!();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 17),
            child: Text(widget.title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w400)),
          ),
          style: TextButton.styleFrom(
            backgroundColor: Color(widget.isSelect ? 0x59F0C579 : 0x1AF5F5F5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          )),
    );
  }
}
