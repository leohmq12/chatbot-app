// features/chatbot/domain/usecases/send_message.dart
import 'package:chatbotapp/features/chatbot/domain/repositories/chatbot_repository.dart';

class SendMessage {
  final ChatbotRepository repository;

  SendMessage({required this.repository});

  Future<String> call(String message) async {
    return await repository.sendMessage(message);
  }
}