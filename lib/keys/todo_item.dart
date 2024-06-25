import 'package:flutter/material.dart';
import 'package:flutter_internals/keys/checkable_todo_item.dart';

class TodoItem extends StatelessWidget {
  const TodoItem(this.text, this.priority, {super.key});

  final String text;
  final Priority priority;

  @override
  Widget build(BuildContext context) {
    IconData icon = Icons.low_priority;

    if (priority == Priority.urgent) {
      icon = Icons.notifications_active;
    }

    if (priority == Priority.normal) {
      icon = Icons.list;
    }

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 12),
          Text(text, style: Theme.of(context).textTheme.displayMedium),
        ],
      ),
    );
  }
}
