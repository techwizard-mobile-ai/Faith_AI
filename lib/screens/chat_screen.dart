// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, use_super_parameters

import 'package:auto_route/auto_route.dart';
import 'package:faith_mobile/core/routes/app_route.gr.dart';
import 'package:faith_mobile/widgets/chat_item.dart';
import 'package:faith_mobile/widgets/hamburger_menu.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  //Here is the State of this screen
  //_controller is for the controlling of the message text field.
  final TextEditingController _controller = TextEditingController();

  //Here is the handlers.
  //Such as the send message or attachfiles or others...
  void handleSendMessage() {}
  @override
  void dispose() {
    _controller
        .dispose(); // Make sure to dispose of the controller when not needed
    super.dispose();
  }

  List<String> botMessages = [
    "Hello, how can I help you today?",
    "I'm having trouble with my account.",
    "Sure, I can assist you with that.",
    "I'm sorry to hear that. Let me guide you through the process.",
    "Thank you for your assistance. Have a great day!",
  ];

  List<String> userMessages = [
    "Hi, I need help with my account.",
    "I'm having trouble with my account.",
    "I'm sorry to hear that. Let me guide you through the process.",
    "Thank you for your assistance. Have a great day!",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              './assets/images/landing-bg.png', // Path to your SVG
              fit: BoxFit.cover, // Cover the entire container
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 70),
                  child: Column(
                    children: [
                      Text(
                        '8:30 AM',
                        style: TextStyle(
                            fontSize: 15,
                            color: Color(0x99FFFFFF),
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w400,
                            height: 1.7,
                            fontFamily: 'Georgia'),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ChatItem(
                        isBot: false,
                        messages: botMessages,
                      ),
                      ChatItem(
                        isBot: true,
                        messages: userMessages,
                      ),
                    ],
                  ),
                )),
                Container(
                  margin: EdgeInsets.only(bottom: 34, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0x1AFFFFFF),
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            )),
                        child: Row(
                          children: [
                            Expanded(
                                child: TextField(
                              controller: _controller,
                              decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 14),
                                  border: InputBorder.none,
                                  hintText: "Your message...",
                                  hintStyle: TextStyle(
                                    color: Color(0x46FFFFFF),
                                    fontSize: 14,
                                    fontFamily: 'Georgia',
                                  )),
                              style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 14,
                                  fontFamily: 'Georgia'),
                            )),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.send),
                              style: ButtonStyle(
                                  backgroundColor: WidgetStateProperty.all(
                                      Colors.transparent),
                                  foregroundColor: WidgetStateProperty.all(
                                      Color(0x32FFFFFF))),
                            ),
                            Transform.rotate(
                              angle: 3.14 / 2,
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.attachment_outlined),
                                style: ButtonStyle(
                                    backgroundColor: WidgetStateProperty.all(
                                        Colors.transparent),
                                    foregroundColor: WidgetStateProperty.all(
                                        Color(0x32FFFFFF))),
                              ),
                            ),
                          ],
                        ),
                      ))
                    ],
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            context.router.pop();
                          },
                          icon: Icon(Icons.arrow_back),
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStateProperty.all(Colors.transparent),
                            foregroundColor:
                                WidgetStateProperty.all(Colors.white),
                          )),
                      Text(
                        'Chat',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                          height: 1.07,
                          fontFamily: 'Playfair',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: null,
                          icon: Icon(Icons.add_box_outlined),
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStateProperty.all(Colors.transparent),
                            foregroundColor:
                                WidgetStateProperty.all(Colors.white),
                          )),
                      HamburgerMenu(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
