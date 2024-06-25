import 'package:flutter/material.dart';
import 'package:flutter_internals/keys/todo_item.dart';
import 'package:flutter_internals/keys/checkable_todo_item.dart';

class Todo {
  Todo(this.text, this.priority);

  final String text;
  final Priority priority;
}

class Keys extends StatefulWidget {
  const Keys({super.key});

  @override
  State<StatefulWidget> createState() => _KeyState();
}

class _KeyState extends State<Keys> {
  var _order = 'asc';
  final _todos = [
    Todo(
      'Learn Flutter',
      Priority.urgent,
    ),
    Todo(
      'Practice Flutter',
      Priority.normal,
    ),
    Todo(
      'Explore other courses',
      Priority.low,
    ),
  ];

  List<Todo> get _orderedTodos {
    final sortedTodos = List.of(_todos);
    sortedTodos.sort((a, b) {
      final bComesAfterA = a.text.compareTo(b.text);
      return _order == 'asc' ? bComesAfterA : -bComesAfterA;
    });
    return sortedTodos;
  }

  void _changeOrder() {
    setState(() {
      _order = _order == 'asc' ? 'desc' : 'asc';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: TextButton.icon(
            onPressed: _changeOrder,
            icon: Icon(
              _order == 'asc' ? Icons.arrow_downward : Icons.arrow_upward,
            ),
            label: Text(
              'Sort ${_order == 'asc' ? 'Descending' : 'Ascending'}',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              for (final todo in _orderedTodos)
                CheckableTodoItem(
                  todo.text,
                  todo.priority,
                ),
            ],
          ),
        )
      ],
    );
  }
}
