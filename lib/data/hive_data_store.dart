import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_todo/models/task.dart';

// All the [CRUD] operational method for Hive DB

class HiveDataStore {
  // Box name String
  static const boxName = 'taskBox';

  // our Current box with all the saved data inside - Box<Task>
  final Box<Task> box = Hive.box<Task>(boxName);

  // Add new task to box
  Future<void> addTask({required Task task}) async {
    await box.put(task.id, task);
  }

  // Show task
  Future<Task?> getTask({required String id}) async {
    return box.get(id);
  }

  // Update task
  Future<void> updateTask({required Task task}) async {
    await task.save();
  }

  // Delete task
  Future<void> deleteTask({required Task task}) async {
    await task.delete();
  }

  // Listen to box Changes
  ValueListenable<Box<Task>> listenToTask() => box.listenable();
}
