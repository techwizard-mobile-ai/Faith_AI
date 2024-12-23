import 'package:flutter/material.dart';
import 'package:myfriendfaith/core/chat/bot.dart';
import 'package:myfriendfaith/core/chat/firestore.dart';
import 'dart:math';

Future<Map<String, dynamic>?> sendMessage(List<Map<String, dynamic>> message,
    String? hid, String apiKey, String baseURL, String? uid) async {
  // String response = botMessages[Random().nextInt(botMessages.length)];
  // String response = await sendToBot(message, apiKey, baseURL);
  Map<String, dynamic> response = await sendToCloudFunction(
      message.sublist(message.length >= 10 ? message.length - 10 : 0),
      uid,
      hid);
  print(message);
  await createHistory(
      message.last['messages'][0], false, response['id'] ?? hid);
  await createHistory(response['response'], true, response['id'] ?? hid);
  return {
    'isBot': true,
    'messages': [response['response']],
    'historyId': response['id'] ?? hid,
  };
}
