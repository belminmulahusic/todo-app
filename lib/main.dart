import 'package:flutter/material.dart';
import '../pages/home_page.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do List',
      theme: ThemeData(primarySwatch: Colors.teal, useMaterial3: true),
      home: const TodoHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
