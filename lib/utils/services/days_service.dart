import 'package:isar/isar.dart';
import 'package:tonnsour/models/day.dart';
import 'package:tonnsour/utils/day_datas.dart';
import 'package:tonnsour/models/plan.dart';
import 'package:tonnsour/models/start_isar.dart';
import 'package:tonnsour/models/task.dart';

import '../../models/goal.dart';
import '../../models/reminder.dart';
import '../../models/tocall.dart';

class DaysService {
  Future<void> addDay(Day day) async {
    await isar.writeTxn(() async {
      await isar.days.put(day);
    });
  }

  Future<List<Day>> findAllDays() async {
    return await isar.days.where().findAll();
  }

  Future<Day?> findDayById(int id) async {
    return await isar.days.get(id);
  }

  Future<Day?> findDayByDate(DateTime date) async {
    return await isar.days
        .filter()
        .dateEqualTo(DateTime(date.year, date.month, date.day))
        .findFirst();
  }

  Stream<List<Day>> watchDays() {
    return isar.days.where().watch(fireImmediately: true);
  }

  Future<void> updateDay(Day updatedDay) async {
    await isar.writeTxn(() async {
      await isar.days.put(updatedDay);
    });
  }

  Future<void> deleteDay(int id) async {
    await isar.writeTxn(() async {
      await isar.days.delete(id);
    });
  }

  Future<DayDatas> loadDay(DateTime dayDate, String period) async {
    final day = await findDayByDate(dayDate);
    if (day == null) {
      return DayDatas(
          day: null,
          goals: [],
          tasks: [],
          reminders: [],
          toCalls: [],
          plans: []);
    }

    await Future.wait([
      day.goals.load(),
      day.tasks.load(),
      day.reminders.load(),
      day.tocalls.load(),
      day.plans.load(),
    ]);

    return DayDatas(
        day: day,
        goals: day.goals.toList(),
        tasks: day.tasks.toList(),
        reminders: day.reminders.toList(),
        toCalls: day.tocalls.toList(),
        plans: day.plans.where((plan) => plan.period == period).toList());
  }
}
