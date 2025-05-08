import 'package:flutter/material.dart';
import 'package:tasks/Model/TaskItem.dart';

class Addtasks extends StatefulWidget {
  final Function(TaskItem) onAddTask;

  const Addtasks({super.key, required this.onAddTask});

  @override
  State<Addtasks> createState() => _AddtasksState();
}

class _AddtasksState extends State<Addtasks> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController textController1 = TextEditingController();
  String? _selectedPriority;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 25),
            TextFormField(
              controller: textController1,
              decoration: InputDecoration(
                labelText: "Task Name",
                hintText: "Enter Task Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator:
                  (value) =>
                      value == null || value.isEmpty
                          ? 'Please enter Task Name'
                          : null,
            ),
            const SizedBox(height: 15),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: "Priority",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              value: _selectedPriority,
              items:
                  ["High", "Medium", "Low"]
                      .map(
                        (priority) => DropdownMenuItem(
                          value: priority,
                          child: Text(priority),
                        ),
                      )
                      .toList(),
              onChanged: (value) => setState(() => _selectedPriority = value),
              validator:
                  (value) =>
                      value == null || value.isEmpty
                          ? 'Please select a Priority'
                          : null,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  TaskItem newTask = TaskItem(

                    nameTask: textController1.text,
                    priority: _selectedPriority,
                  );

                  widget.onAddTask(newTask);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Row(
                        children: const [
                          Icon(Icons.check_circle, color: Colors.white),
                          SizedBox(width: 10),
                          Text(
                            "Task added successfully!",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      backgroundColor: const Color(0xFF0887C6),
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      duration: const Duration(seconds: 3),
                      margin: const EdgeInsets.all(16),
                      elevation: 6,
                    ),
                  );

                  setState(() {
                    textController1.clear();
                    _selectedPriority = null;
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 55),
                backgroundColor: const Color.fromARGB(255, 8, 135, 198),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text("Add Task", style: TextStyle(fontSize: 20)),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
