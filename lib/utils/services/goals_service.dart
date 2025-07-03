import 'package:isar/isar.dart';
import 'package:tonnsour/models/goal.dart';
import 'package:tonnsour/models/start_isar.dart';

class GoalsService {
  Future<void> addGoal(Goal goal) async {
    await isar.writeTxn(() async {
      await isar.goals.put(goal);
    });
  }

  Future<List<Goal>> findAllGoals() async {
    return await isar.goals.where().findAll();
  }

  Future<Goal?> findGoalById(int id) async {
    return await isar.goals.get(id);
  }

  Stream<List<Goal>> watchGoals() {
    return isar.goals.where().watch(fireImmediately: true);
  }

  Future<void> updateGoal(
      {required int goalId, String? newName, bool? isDone}) async {
    await isar.writeTxn(() async {
      final goalToUpdate = await isar.goals.get(goalId);
      if (goalToUpdate != null) {
        if (newName != null) goalToUpdate.name = newName;
        if (isDone != null) goalToUpdate.isDone = isDone;
        await isar.goals.put(goalToUpdate);
      }
    });
  }

  Future<void> deleteGoal(int id) async {
    await isar.writeTxn(() async {
      await isar.goals.delete(id);
    });
  }
}
