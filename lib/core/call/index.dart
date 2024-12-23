import 'dart:typed_data';

import "package:http/http.dart" as http;
import 'dart:convert';

Future<Uint8List> callToBot(String? message) async {
  final audioStream = await http
      .get(Uri.parse('https://generatevoice-nulrzzis2a-uc.a.run.app'));
  final audiodate = await audioStream.bodyBytes;
  return audiodate;
}
