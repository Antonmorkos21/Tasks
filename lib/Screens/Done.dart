import 'package:flutter/material.dart';
import 'package:tasks/Model/TaskItem.dart';

class Done extends StatelessWidget {
  final List<TaskItem> doneTasks;
  final void Function(int) onUndo;
  final void Function(int) onRemove;

  const Done({
    super.key,
    required this.doneTasks,
    required this.onUndo,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return doneTasks.isEmpty
        ? const Center(child: Text("No tasks completed yet."))
        : ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: doneTasks.length,
          itemBuilder: (context, index) {
            final task = doneTasks[index];
            return Card(
              color: Colors.blueGrey[600],
              child: ListTile(
                leading: IconButton(
                  onPressed: () => onUndo(index),
                  icon: const Icon(Icons.undo),
                  color: Colors.orange,
                  tooltip: "Undo",
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
