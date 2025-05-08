class TaskItem {
  String? nameTask;
  String? priority;

  TaskItem({required this.nameTask, required this.priority});

  Map<String, dynamic> toJson() => {'nameTask': nameTask, 'priority': priority};

  factory TaskItem.fromJson(Map<String, dynamic> json) =>
      TaskItem(nameTask: json['nameTask'], priority: json['priority']);
}
