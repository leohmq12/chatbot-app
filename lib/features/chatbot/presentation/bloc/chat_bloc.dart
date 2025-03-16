// features/chatbot/presentation/bloc/chat_bloc.dart
import 'package:chatbotapp/features/chatbot/domain/entities/chat_message.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chatbotapp/features/chatbot/domain/usecases/send_message.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final SendMessage sendMessage;

  ChatBloc({required this.sendMessage}) : super(ChatInitial()) {
    on<SendMessageEvent>(_onSendMessage);
  }

  void _onSendMessage(SendMessageEvent event, Emitter<ChatState> emit) async {
    emit(ChatLoading());
    try {
      final response = await sendMessage(event.message);
      emit(ChatLoaded(messages: [
        ...(state as ChatLoaded).messages,
        ChatMessage(role: 'user', message: event.message),
        ChatMessage(role: 'bot', message: response),
      ]));
    } catch (e) {
      emit(ChatError(message: e.toString()));
    }
  }
}