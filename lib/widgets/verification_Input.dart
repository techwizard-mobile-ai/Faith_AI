import 'package:flutter/material.dart';

class VerificationInput extends StatefulWidget {
  final focusnode;
  final controller;
  const VerificationInput(
      {Key? key, required this.focusnode, required this.controller})
      : super(key: key);

  @override
  _VerificationInputState createState() => _VerificationInputState();
}

class _VerificationInputState extends State<VerificationInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        focusNode: widget.focusnode,
        controller: widget.controller,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: TextStyle(color: Colors.white, fontSize: 20),
        maxLength: 1,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          counterText: '',
          helper: null,
          hintText: '0',
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.3)),
          focusColor: Colors.white,
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
        ),
      ),
    );
  }
}
