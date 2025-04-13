import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final String taskName;

  const TodoTile({super.key, required this.taskName});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Text(taskName, style: const TextStyle(fontSize: 18)),
    );
  }
}
