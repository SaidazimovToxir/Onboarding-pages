import 'package:flutter/material.dart';

class Todo {
  final String title;
  bool isCompleted;

  Todo({
    required this.title,
    this.isCompleted = false,
  });
}

class TodoApp extends StatefulWidget {
  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  List<Todo> todos = [
    Todo(title: 'Task 1'),
    Todo(title: 'Task 2'),
    Todo(title: 'Task 3'),
  ];

  void toggleTodoCompletion(int index) {
    setState(() {
      todos[index].isCompleted = !todos[index].isCompleted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              todos[index].title,
              style: TextStyle(
                decoration: todos[index].isCompleted
                    ? TextDecoration.lineThrough
                    : null,
              ),
            ),
            trailing: Checkbox(
              value: todos[index].isCompleted,
              onChanged: (bool? value) {
                toggleTodoCompletion(index);
              },
            ),
          );
        },
      ),
    );
  }
}
