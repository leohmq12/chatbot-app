import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatbotRemoteDataSource {
  final String apiKey;

  ChatbotRemoteDataSource({required this.apiKey});

  Future<String> sendMessage(String message) async {
    final response = await http.post(
      Uri.parse('https://api.openai.com/v1/chat/completions'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        'model': 'gpt-3.5-turbo', // Use GPT-3.5 or GPT-4
        'messages': [
          {'role': 'user', 'content': message}
        ],
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['choices'][0]['message']['content'];
    } else {
      throw Exception('Failed to load response: ${response.body}');
    }
  }
}