import 'package:isar/isar.dart';
import 'package:tonnsour/models/start_isar.dart';
import 'package:tonnsour/models/task.dart';

class TasksService {
  Future<void> addTask(Task task) async {
    await isar.writeTxn(() async {
      await isar.tasks.put(task);
    });
  }

  Future<List<Task>> findAllTasks() async {
    return await isar.tasks.where().findAll();
  }

  Future<Task?> findTaskById(int id) async {
    return await isar.tasks.get(id);
  }

  Stream<List<Task>> watchTasks() {
    return isar.tasks.where().watch(fireImmediately: true);
  }

  Future<void> updateTask(
      {required int taskId, String? newName, bool? isDone}) async {
    await isar.writeTxn(() async {
      final taskToUpdate = await isar.tasks.get(taskId);
      if (taskToUpdate != null) {
        if (newName != null) taskToUpdate.name = newName;
        if (isDone != null) taskToUpdate.isDone = isDone;
        await isar.tasks.put(taskToUpdate);
      }
    });
  }

  Future<void> deleteTask(int id) async {
    await isar.writeTxn(() async {
      await isar.tasks.delete(id);
    });
  }
}
