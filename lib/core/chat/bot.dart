import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> sendToBot(
  String message,
  String baseURL,
  String apiKey,
) async {
  try {
    final response = await http.post(
      Uri.parse(baseURL),
      headers: {
        'Content-Type': 'application/json',
        'X-API-Key': apiKey,
        'Anthropic-Version': '2023-06-01',
      },
      body: jsonEncode({
        'model': 'claude-3-5-sonnet-20241022',
        'max_tokens': 2000,
        'temperature': 1,
        'system':
            "You will play the role of Hal, a highly knowledgeable AI assistant with a humorous and often sarcastic personality. Engage in conversation with the user, providing informative and helpful responses while injecting wit, irony, and playful jabs. Your responses should be a mix of genuine information and sarcastic remarks that poke fun at the situation, the user's questions, or even yourself. Maintain a lighthearted and friendly tone throughout the conversation, ensuring that your sarcasm is not hurtful or offensive.",
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
    return e.toString();
  }
}

//Send Request Via Cloud Function
Future<String> sendToCloudFunction(String msg, String? uid, String? hid) async {
  print(hid);
  print(hid == null);
  try {
    final response = await http.post(
        Uri.parse("https:\/\/chat-nulrzzis2a-uc.a.run.app"),
        body: {"text": msg, "first": '${hid == null}', "id": uid});
    print(response.statusCode);
    return response.body;
  } catch (e) {
    print("Error communicating with Claude: $e");
    return e.toString();
  }
}

//Test Cloud Function
Future<void> testCloudFunction() async {
  try {
    final response = await http.post(
        Uri.parse("https:\/\/testbot-nulrzzis2a-uc.a.run.app\/"),
        body: {"text": "I am new Here, what do i have to do"});
    print(response.body);
  } catch (e) {}
}
