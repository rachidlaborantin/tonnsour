import 'package:isar/isar.dart';
import 'package:tonnsour/models/plan.dart';
import 'package:tonnsour/models/start_isar.dart';
import 'package:tonnsour/models/task.dart';

class PlansService {
  Future<void> addPlan(Plan plan) async {
    await isar.writeTxn(() async {
      await isar.plans.put(plan);
    });
  }

  Future<List<Plan>> findAllPlans() async {
    return await isar.plans.where().findAll();
  }

  Future<Plan?> findPlanById(int id) async {
    return await isar.plans.get(id);
  }

  Stream<List<Plan>> watchPlans() {
    return isar.plans.where().watch(fireImmediately: true);
  }

  Future<void> updatePlan(
      {required int planId,
      String? newPlan,
      String? newHour,
      bool? timePassed}) async {
    await isar.writeTxn(() async {
      final planToUpdate = await isar.plans.get(planId);
      if (planToUpdate != null) {
        if (newPlan != null) planToUpdate.plan = newPlan;
        if (newHour != null) planToUpdate.hour = newHour;
        if (timePassed != null) planToUpdate.timePassed = timePassed;
        await isar.plans.put(planToUpdate);
      }
    });
  }

  Future<void> deletePlan(int id) async {
    await isar.writeTxn(() async {
      await isar.plans.delete(id);
    });
  }
}
