import 'package:flutter/material.dart';

class TodoHomePage extends StatelessWidget {
  const TodoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TODO\'s',
          style: TextStyle(
            fontSize: 26,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                color: Colors.black,
                offset: Offset(1.0, 1.0),
                blurRadius: 1.0,
              ),
            ],
          ),
        ),
        backgroundColor: Color(0xFF1995AD),
      ),
    );
  }
}
