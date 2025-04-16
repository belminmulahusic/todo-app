import 'package:flutter/material.dart';
import 'dart:math';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool isDone;
  final int minutes;
  final Function(bool?) onChanged;

  const TodoTile({
    super.key,
    required this.taskName,
    required this.isDone,
    required this.minutes,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: Container(
        width: 400,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 79, 193, 255),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Opacity(
          opacity: isDone ? 0.5 : 1.0,
          child: Row(
            children: [
              Checkbox(
                value: isDone,
                onChanged: onChanged,
                activeColor: const Color.fromARGB(255, 187, 230, 255),
                checkColor: const Color.fromARGB(255, 0, 44, 78),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 79, 193, 255),
                    ),
                    child: Text(
                      taskName,
                      style: TextStyle(
                        fontSize: 18,
                        decoration:
                            isDone
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                      ),
                      overflow: TextOverflow.visible,
                      maxLines: null,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    minutes.toString(),
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: isDone ? 0.5 : 1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
