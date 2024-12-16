import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialIconButton extends StatefulWidget {
  final Function() onPressed;
  final String iconUrl;
  const SocialIconButton(
      {Key? key, required this.onPressed, required this.iconUrl})
      : super(key: key);

  @override
  _SocialIconButtonState createState() => _SocialIconButtonState();
}

class _SocialIconButtonState extends State<SocialIconButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Image.asset(
          widget.iconUrl,
          height: 25,
          width: 25,
        ),
        onPressed: () {
          widget.onPressed();
        },
        style: IconButton.styleFrom(
            backgroundColor: Colors.transparent,
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                side: BorderSide(
                  color: Colors.white.withOpacity(0.2),
                  width: 1,
                ))));
  }
}
