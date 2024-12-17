import 'package:flutter/material.dart';
import 'package:myfriendfaith/core/chat/bot.dart';
import 'package:myfriendfaith/core/chat/firestore.dart';
import 'dart:math';

Future<Map<String, dynamic>?> sendMessage(
    String message, String? hid, String apiKey, String baseURL) async {
  List<String> botMessages = [
    "Hello, how can I help you today?",
    "I'm having trouble with my account.",
    "Sure, I can assist you with that.",
    "I'm sorry to hear that. Let me guide you through the process.",
    "Thank you for your assistance. Have a great day!",
  ];
  String? docRef = await createHistory(message, false, hid);
  // String response = botMessages[Random().nextInt(botMessages.length)];
  String response = await sendToBot(message, apiKey, baseURL);
  print("---------------------------------------------");
  print(response);
  print("---------------------------------------------");

  if (docRef != null) {
    await createHistory(response, true, docRef);
  }
  return {
    'isBot': true,
    'messages': [response],
    'historyId': docRef,
  };
}
