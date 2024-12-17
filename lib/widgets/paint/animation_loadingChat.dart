import 'package:flutter/material.dart';

class AnimationLoadingChat extends StatefulWidget {
  final int duration;
  const AnimationLoadingChat({Key? key, required this.duration})
      : super(key: key);

  @override
  _AnimationLoadingChatState createState() => _AnimationLoadingChatState();
}

class _AnimationLoadingChatState extends State<AnimationLoadingChat>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  Future<void> startAnimation() async {
    await Future.delayed(Duration(milliseconds: widget.duration));
    _controller.repeat(reverse: true);
    // _controller.forward();
  }

  @override
  initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    _animation = Tween<Offset>(begin: Offset(1, 0.5), end: Offset(1, 0))
        .animate(_controller);
    startAnimation();
  }

  @override
  void dispose() {
    _controller.stop();
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2),
      child: SlideTransition(
        position: _animation,
        child: Container(
          width: 5,
          height: 5,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 0),
                ),
              ]),
        ),
      ),
    );
  }
}
