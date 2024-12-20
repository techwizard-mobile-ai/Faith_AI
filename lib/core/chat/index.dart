import 'package:flutter/material.dart';
import 'package:myfriendfaith/core/chat/bot.dart';
import 'package:myfriendfaith/core/chat/firestore.dart';
import 'dart:math';

Future<Map<String, dynamic>?> sendMessage(String message, String? hid,
    String apiKey, String baseURL, String? uid) async {
  String? docRef = await createHistory(message, false, hid);
  // String response = botMessages[Random().nextInt(botMessages.length)];
  // String response = await sendToBot(message, apiKey, baseURL);
  String response = await sendToCloudFunction(message, uid, hid);
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
