import 'package:flutter/material.dart';
import 'todo_tile.dart';

class TodoHomePage extends StatelessWidget {
  const TodoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 189, 232, 255),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 79, 193, 255),
        title: const Text(
          'TODO\'s',
          style: TextStyle(
            fontFamily: 'Cleanow',
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                color: Color.fromARGB(255, 17, 70, 98),
                offset: Offset(3.0, 1.0),
                blurRadius: 3.0,
              ),
            ],
            letterSpacing: 2,
          ),
        ),
      ),
      body: Column(
        children: [
          const Divider(
            color: Color.fromARGB(255, 72, 173, 227),
            thickness: 10,
            height: 10,
          ),
          TodoTile(taskName: 'Test task'),
        ],
      ),
    );
  }
}
