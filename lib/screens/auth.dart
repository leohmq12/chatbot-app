import 'package:flutter/material.dart';
import 'services/auth_service.dart';

class AuthScreen extends StatelessWidget {
  final AuthService _authService = AuthService();

  AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login/Signup'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                await _authService.signInWithGoogle();
                Navigator.pop(context); // Go back to home screen after login
              },
              child: const Text('Sign in with Google'),
            ),
          ],
        ),
      ),
    );
  }
}