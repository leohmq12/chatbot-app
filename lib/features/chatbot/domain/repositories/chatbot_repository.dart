// features/chatbot/domain/repositories/chatbot_repository.dart
abstract class ChatbotRepository {
  Future<String> sendMessage(String message);
}