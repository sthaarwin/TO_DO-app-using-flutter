import 'package:flutter/material.dart';
import 'package:to_do/auth/authform.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Authentication'.toUpperCase()),
        backgroundColor: Colors.purple,
      ),
      body: const AuthForm(),
    );
  }
}
