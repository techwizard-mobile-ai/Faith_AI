// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, use_super_parameters

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myfriendfaith/core/chat/firestore.dart';
import 'package:myfriendfaith/core/chat/index.dart';
import 'package:myfriendfaith/widgets/chat_item.dart';
import 'package:myfriendfaith/widgets/current_time.dart';
import 'package:myfriendfaith/widgets/hamburger_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:myfriendfaith/widgets/paint/animation_loadingChat.dart';

@RoutePage()
class ChatScreen extends StatefulWidget {
  String? historyId;
  ChatScreen({Key? key, this.historyId}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Map<String, dynamic>> messages = [];
  bool isWaiting = true;
  String? hid;
  //Here is the State of this screen
  //_controller is for the controlling of the message text field.
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final String apiKey = dotenv.env['API_KEY']!;
  final String baseURL = dotenv.env['BOT_BASE_URL']!;
  //
  //Here is the handlers.
  //Such as the send message or attachfiles or others...
  Future<void> handleSendMessage() async {
    if (_controller.text.isNotEmpty) {
      setState(() {
        messages.add({
          'isBot': false,
          'messages': [_controller.text]
        });
        isWaiting = true;
      });

      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOut,
        );
      });
      String tempReq = _controller.text;
      _controller.clear();
      print(messages.last);
      Map<String, dynamic>? response = await sendMessage(messages, hid, apiKey,
          baseURL, FirebaseAuth.instance.currentUser?.uid);
      messages.add(response!);
      setState(() {
        isWaiting = false;
        hid ??= response['historyId'];
      });
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    }
  }

  //Get the last history.
  Future<void> getHistory() async {
    List<Map<String, dynamic>>? histories = await readHistory(hid);
    if (histories != null && histories.isNotEmpty) {
      histories = histories.map((item) {
        return {
          'isBot': item['isBot'],
          'messages': item['messages'],
          'historyId': item['historyId']
        };
      }).toList();
      print(histories);
      setState(() {
        messages = histories!;
        isWaiting = false;
        hid = histories[0]['historyId'];
      });
    } else {
      setState(() {
        messages.add({
          'isBot': true,
          'messages': ['What Can I help you?']
        });
        isWaiting = false;
      });
    }
  }

  //Start New Chat and Save this history
  Future<void> startNewChat() async {
    setState(() {
      messages.clear();
      messages.add({
        'isBot': true,
        'messages': ['How Can I help you, today?']
      });
      hid = null;
    });
  }

  //ChatItems Spread
  Widget chatItemShow(item) {
    return ChatItem(
        isBot: item['isBot'],
        messages: item['messages'].map((mItem) => mItem as String).toList());
  }

  @override
  initState() {
    hid = widget.historyId;
    getHistory();
  }

  @override
  void dispose() {
    _controller.dispose();
    // Make sure to dispose of the controller when not needed
    super.dispose();
  }

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
                    children: [CurrentTime()],
                  ),
                ),
                Expanded(
                    child: SingleChildScrollView(
                  controller: _scrollController,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Column(
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: messages.map(chatItemShow).toList()),
                      isWaiting
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AnimationLoadingChat(
                                  duration: 300,
                                ),
                                AnimationLoadingChat(
                                  duration: 800,
                                ),
                                AnimationLoadingChat(
                                  duration: 1300,
                                )
                              ],
                            )
                          : SizedBox.shrink()
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
                              // expands: true,
                              maxLines: null,
                              minLines: null,

                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 14, vertical: 10),
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
                              onPressed: () {
                                handleSendMessage();
                              },
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
                          onPressed: () {
                            startNewChat();
                          },
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
