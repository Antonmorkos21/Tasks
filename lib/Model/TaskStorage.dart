import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasks/Model/TaskItem.dart';

class TaskStorage {
  static const _taskKey = 'task_items';
  static const _doneKey = 'done_task_items';

  Future<void> saveTasks(List<TaskItem> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    final data = tasks.map((t) => t.toJson()).toList();
    await prefs.setString(_taskKey, jsonEncode(data));
  }

  Future<void> saveDoneTasks(List<TaskItem> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    final data = tasks.map((t) => t.toJson()).toList();
    await prefs.setString(_doneKey, jsonEncode(data));
  }

  Future<List<TaskItem>> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_taskKey);
    if (raw == null) return [];
    final decoded = jsonDecode(raw) as List;
    return decoded.map((e) => TaskItem.fromJson(e)).toList();
  }

  Future<List<TaskItem>> loadDoneTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_doneKey);
    if (raw == null) return [];
    final decoded = jsonDecode(raw) as List;
    return decoded.map((e) => TaskItem.fromJson(e)).toList();
  }
}
