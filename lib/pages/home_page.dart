import 'package:flutter/material.dart';
import 'todo_tile.dart';

class TodoHomePage extends StatefulWidget {
  const TodoHomePage({super.key});

  @override
  State<TodoHomePage> createState() => _TodoHomePage();
}

class _TodoHomePage extends State<TodoHomePage> {
  List tasks = [
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

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.lightBlue,
      shadowColor: const Color.fromARGB(255, 0, 0, 0),
      elevation: 3,
      title: Text(
        "TODO's",
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Cleanow',
          fontSize: 45,
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(
              color: const Color.fromARGB(255, 169, 169, 169),
              offset: Offset(6, 0),
              blurRadius: 2,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTodoList() {
    return ReorderableListView.builder(
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
          key: ValueKey(tasks[index]),
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
            child: Transform.scale(scale: 1.03, child: child),
          ),
        );
      },
    );
  }

  Widget buildFloatingButton() {
    return SizedBox(
      width: 80,
      height: 80,
      child: FloatingActionButton(
        foregroundColor: Colors.blue,
        backgroundColor: Colors.white,
        splashColor: const Color.fromARGB(255, 175, 230, 255),
        onPressed: showAddTaskDialog,
        isExtended: true,
        enableFeedback: true,
        child: Icon(Icons.edit),
      ),
    );
  }

  void createNewTask(task) {
    setState(() {
      tasks.add(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 189, 232, 255),
      appBar: buildAppBar(),
      body: buildTodoList(),
      floatingActionButton: buildFloatingButton(),
    );
  }

  void showAddTaskDialog() {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text("Create new task"),
            content: TextField(
              controller: controller,
              decoration: InputDecoration(hintText: "new task"),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  String task = controller.text;
                  if (task.isNotEmpty) {
                    setState(() {
                      tasks.add([task, false, 0]);
                    });
                  }
                  Navigator.pop(context);
                },
                child: Text("Save"),
              ),
              TextButton(onPressed: () {}, child: Text("Cancel")),
            ],
          ),
    );
  }
}
