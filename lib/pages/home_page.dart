import 'package:flutter/material.dart';
import 'todo_tile.dart';

class TodoHomePage extends StatefulWidget {
  const TodoHomePage({super.key});

  @override
  State<TodoHomePage> createState() => _TodoHomePage();
}

class _TodoHomePage extends State<TodoHomePage> {
  final List tasks = [
    ['Do homework in english', false, 20],
    ['Write french essay', false, 60],
    ['Cook meal for tomorrow', false, 30],
    ['Clean your room', false, 40],
    ['Go for a walk', false, 90],
    ['Study for DS', false, 60],
    ['Build an app', false, 120],
    ['Study chapter 3, 4, 5, 6 in maths', false, 20],
    [
      'Write a long ass line to see how far the box will go, Write a long ass line to see how far the box will go',
      false,
      5,
    ],
    ['Whatup', false, 15],
  ];

  int calculateDuration(index) {
    return 0;
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      tasks[index][1] = !tasks[index][1];
    });
  }

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
                color: Color.fromARGB(255, 165, 165, 165),
                offset: Offset(5, 0),
                blurRadius: 0,
              ),
            ],
            letterSpacing: 2,
          ),
        ),
      ),
      body: ReorderableListView.builder(
        itemCount: tasks.length,
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (newIndex > oldIndex) newIndex -= 1;
            final item = tasks.removeAt(oldIndex);
            tasks.insert(newIndex, item);
          });
        },
        itemBuilder: (context, index) {
          return TodoTile(
            key: ValueKey(tasks[index][0]),
            taskName: tasks[index][0],
            isDone: tasks[index][1],
            minutes: tasks[index][2],
            onChanged: (value) => checkBoxChanged(value, index),
          );
        },
        proxyDecorator: (Widget child, int index, Animation<double> animation) {
          return Material(
            elevation: 20,
            color: Colors.transparent,
            child: Opacity(
              opacity: 0.8,
              child: Transform.scale(scale: 1.04, child: child),
            ),
          );
        },
      ),
    );
  }
}
