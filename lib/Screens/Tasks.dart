import 'package:flutter/material.dart';
import 'package:tasks/Model/TaskItem.dart';

class Tasks extends StatelessWidget {
  final List<TaskItem> tasks;
  final void Function(int) onDone;
  final void Function(int) onRemove;

  const Tasks({
    super.key,
    required this.tasks,
    required this.onDone,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return tasks.isEmpty
        ? const Center(child: Text("No tasks added yet."))
        : ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final task = tasks[index];
            return Card(
              color: Colors.blueGrey[600],
              child: ListTile(
                leading: IconButton(
                  onPressed: () {
                    onDone(index);
                  },
                  icon: const Icon(Icons.check_box_outline_blank_sharp),
                  color: Colors.green,
                ),
                title: Text(
                  "Task: ${task.nameTask}",
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  "Priority: ${task.priority}",
                  style: const TextStyle(color: Colors.white),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.redAccent),
                  onPressed: () => onRemove(index),
                ),
              ),
            );
          },
        );
  }
}
