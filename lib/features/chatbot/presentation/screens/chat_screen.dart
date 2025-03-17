// features/chatbot/presentation/screens/chat_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chatbotapp/features/chatbot/presentation/bloc/chat_bloc.dart';
import 'package:chatbotapp/features/chatbot/data/datasources/chatbot_remote_datasource.dart';
import 'package:chatbotapp/features/chatbot/data/repositories/chatbot_repository_impl.dart';
import 'package:chatbotapp/features/chatbot/domain/usecases/send_message.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chatbot')),
      body: BlocProvider(
        create: (context) => ChatBloc(
          sendMessage: SendMessage(
            repository: ChatbotRepositoryImpl(
              remoteDataSource: ChatbotRemoteDataSource(
                apiKey: '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',
              ),
            ),
          ),
        ),
        child: ChatView(),
      ),
    );
  }
}

class ChatView extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<ChatBloc, ChatState>(
            builder: (context, state) {
              if (state is ChatLoaded) {
                return ListView.builder(
                  itemCount: state.messages.length,
                  itemBuilder: (context, index) {
                    final message = state.messages[index];
                    return ListTile(
                      title: Text(message.message),
                      subtitle: Text(message.role),
                    );
                  },
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(hintText: 'Type a message'),
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  context.read<ChatBloc>().add(SendMessageEvent(_controller.text));
                  _controller.clear();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}