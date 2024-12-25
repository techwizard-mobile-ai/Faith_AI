import 'dart:typed_data';

import "package:http/http.dart" as http;

Future<Uint8List> callToBot(String? message, String? hid, String uid) async {
  final audioStream = await http.post(
      Uri.parse('https://generatevoice-nulrzzis2a-uc.a.run.app'),
      body: {"message": message, 'historyid': hid ?? 'null', 'id': uid});
  print(audioStream.headers);
  final audiodate = await audioStream.bodyBytes;
  return audiodate;
}
