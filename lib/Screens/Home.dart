import 'package:flutter/material.dart';
import 'package:tasks/Model/TaskItem.dart';
import 'package:tasks/Model/TaskStorage.dart';
import 'package:tasks/Screens/Done.dart';
import 'package:tasks/Screens/Tasks.dart';
import 'package:tasks/Screens/About.dart';
import 'package:tasks/Screens/AddTasks.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<TaskItem> tasksList = [];
  List<TaskItem> doneList = [];
  final TaskStorage taskStorage = TaskStorage();

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    final tasks = await taskStorage.loadTasks();
    final doneTasks = await taskStorage.loadDoneTasks();
    setState(() {
      tasksList = tasks;
      doneList = doneTasks;
    });
  }

  void addTask(TaskItem item) async {
    setState(() {
      tasksList.add(item);
    });
    await taskStorage.saveTasks(tasksList);
  }

  void sentAsDone(int index) async {
    setState(() {
      doneList.add(tasksList[index]);
      tasksList.removeAt(index);
    });
    await taskStorage.saveTasks(tasksList);
    await taskStorage.saveDoneTasks(doneList);
  }

  void removeTask(int index) async {
    setState(() {
      tasksList.removeAt(index);
    });
    await taskStorage.saveTasks(tasksList);
  }

  void undoTask(int index) async {
    setState(() {
      tasksList.add(doneList[index]);
      doneList.removeAt(index);
    });
    await taskStorage.saveTasks(tasksList);
    await taskStorage.saveDoneTasks(doneList);
  }

  void removeDoneTask(int index) async {
    setState(() {
      doneList.removeAt(index);
    });
    await taskStorage.saveDoneTasks(doneList);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          bottom: const TabBar(
            indicatorColor: Colors.blueAccent,
            labelColor: Colors.blueAccent,
            unselectedLabelColor: Colors.white,
            tabs: [
              Tab(text: 'Tasks', icon: Icon(Icons.format_list_bulleted)),
              Tab(text: 'Add Task', icon: Icon(Icons.post_add_outlined)),
              Tab(text: 'Done', icon: Icon(Icons.done_outline_outlined)),
              Tab(text: 'About', icon: Icon(Icons.perm_device_info)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Tasks(tasks: tasksList, onDone: sentAsDone, onRemove: removeTask),
            Addtasks(onAddTask: addTask),
            Done(
              doneTasks: doneList,
              onUndo: undoTask,
              onRemove: removeDoneTask,
            ),
            About(),
          ],
        ),
        backgroundColor: const Color.fromARGB(199, 255, 255, 255),
      ),
    );
  }
}
