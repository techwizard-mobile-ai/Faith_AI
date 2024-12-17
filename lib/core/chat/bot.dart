import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<String> sendToBot(String message, String apiKey, String baseURL) async {
  try {
    final response = await http.post(
      Uri.parse(baseURL),
      headers: {
        'Content-Type': 'application/json',
        'X-API-Key': apiKey,
        'Anthropic-Version': '2023-06-01',
      },
      body: jsonEncode({
        'model': 'claude-3-haiku-20240307',
        'max_tokens': 1024,
        'messages': [
          {'role': 'user', 'content': message}
        ]
      }),
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return jsonResponse['content'][0]['text'];
    } else {
      throw Exception('Failed to load response: ${response.body}');
    }
  } catch (e) {
    print("Error communicating with Claude: $e");
    return "An error occurred";
  }
}
