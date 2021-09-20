import 'task.dart';

class Plan {
  String name = '';
  final List<Task> tasks = [];

  int get completeCount {
    return tasks.where((task) => task.complete).length;
  }

  String get completenessMessage {
    return '$completeCount out of ${tasks.length} tasks';
  }
}
