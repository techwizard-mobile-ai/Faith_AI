// ignore_for_file: prefer_const_constructors, prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputFormItem extends StatefulWidget {
  final TextEditingController? controller;
  final String hintTxt;
  final Icon? leadingIco;
  final Icon? trailIco;
  final bool? isRequired;
  final TextInputType? keyboardType;
  InputFormItem({
    Key? key,
    required this.controller,
    required this.hintTxt,
    this.leadingIco,
    this.isRequired,
    this.trailIco,
    this.keyboardType,
  }) : super(key: key);

  @override
  _InputFormItemState createState() => _InputFormItemState();
}

class _InputFormItemState extends State<InputFormItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: TextField(
          controller: widget.controller,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontFamily: 'Georgia',
          ),
          obscureText: widget.keyboardType == TextInputType.visiblePassword,
          keyboardType: widget.keyboardType == null
              ? TextInputType.text
              : widget.keyboardType,
          decoration: InputDecoration(
              hintText: widget.hintTxt,
              contentPadding: EdgeInsets.symmetric(vertical: 17, horizontal: 8),
              hintStyle: TextStyle(
                fontSize: 14,
                color: Colors.white.withOpacity(0.6),
                fontFamily: 'Georgia',
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Colors.white.withOpacity(0.2),
                    width: 1.0,
                  )),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide:
                    BorderSide(color: Colors.white.withOpacity(0.2), width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide:
                    BorderSide(color: Colors.white.withOpacity(0.2), width: 2),
              ),
              fillColor: Colors.transparent,
              filled: true,
              prefixIcon: widget.leadingIco,
              suffixIcon: widget.keyboardType != TextInputType.visiblePassword
                  ? widget.trailIco
                  : Icon(
                      Icons.visibility_outlined,
                      color: Colors.white.withOpacity(0.8),
                    ))),
    );
  }
}
