import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Center(
              child: const Text(
                "Task Manager App",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "The Task Management App is a simple yet powerful tool that helps users organize their daily tasks and boost productivity. The app allows users to add, update, categorize, and mark tasks as complete when finished. It also enables users to delete or reorder tasks with ease",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            const Text(
              "Key Features:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "Add tasks with a title and priority.\n Mark tasks as completed and move them to the completed tasks list.\n Manage priorities using colors to distinguish tasks based on importance.\nUndo or delete tasks when necessary.",
            ),
            const SizedBox(height: 25),
            const Text(
              "Technologies Used:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text("Flutter: For building the user interface.j"),
            const SizedBox(height: 25),
            const Text(
              "Me:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text("Name:Anton Morkos .\n Flutter Mobile App Devoloper\n "),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(0, 255, 255, 255),
    );
  }
}
