// features/chatbot/data/repositories/chatbot_repository_impl.dart
import 'package:chatbotapp/features/chatbot/data/datasources/chatbot_remote_datasource.dart';
import 'package:chatbotapp/features/chatbot/domain/repositories/chatbot_repository.dart';

class ChatbotRepositoryImpl implements ChatbotRepository{
  final ChatbotRemoteDataSource remoteDataSource;

  ChatbotRepositoryImpl({required this.remoteDataSource});

  @override
  Future<String> sendMessage(String message) async {
    return await remoteDataSource.sendMessage(message);
  }
}