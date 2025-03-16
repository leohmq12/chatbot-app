import 'package:flutter/material.dart';
import 'package:chatbotapp/features/chatbot/presentation/screens/chat_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatScreen(), // Or add it to your navigation
    );
  }
}