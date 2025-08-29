import 'package:flutter/cupertino.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tonnsour/models/tocall.dart';
import 'package:tonnsour/utils/constants.dart';
import 'package:tonnsour/utils/services/days_service.dart';

import '../models/day.dart';
import '../models/goal.dart';
import '../models/plan.dart';
import '../models/reminder.dart';
import '../models/start_isar.dart';
import '../models/task.dart';

class Helpers {
  static Future<void> saveStringPref(String prefKey, String value) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(prefKey, value);
  }

  static Future<void> saveIntegerPref(String prefKey, int value) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setInt(prefKey, value);
  }

  static Future<String?> getStringPref(String prefKey) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(prefKey);
  }

  static Future<int?> getIntegerPref(String prefKey) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getInt(prefKey);
  }

  /// Utility to obtain the hours between the day start time and the day end time
  static List<String> generateTimeRange(
      {required String startTime, required String endTime}) {
    final startParts = startTime.split(':').map(int.parse).toList();
    final endParts = endTime.split(':').map(int.parse).toList();

    final startHour = startParts[0];
    final startMinute = startParts[1];
    final endHour = endParts[0];

    final List<String> hours = [];

    // Add the start hour
    hours.add(
        '${startHour.toString().padLeft(2, '0')}:${startMinute.toString().padLeft(2, '0')}');

    // Add the full hour
    for (int h = startHour + 1; h <= endHour; h++) {
      hours.add('${h.toString().padLeft(2, '0')}:00');
    }

    return hours;
  }

  /// A function to check whether the time of a plan is considered as
  /// passed
  ///
  static bool isTimePassed(DateTime planDate, String timeStr) {
    final now = DateTime.now();
    final parts = timeStr.split(':');

    if (parts.isEmpty || parts.length > 2) return true;

    final hour = int.tryParse(parts[0].padLeft(2, '0'));
    final minute = parts.length == 2 && parts[1].isNotEmpty
        ? int.tryParse(parts[1])
        : 59; // If minute is null, we take 59min to reach the end of the hour

    if (hour == null || minute == null) return false;

    final inputDate =
        DateTime(planDate.year, planDate.month, planDate.day, hour, minute);

    return inputDate.isBefore(now);
  }

  // Create the new day on page showing
  void addNewDay(DateTime date, List<String> morningHours,
      List<String> eveningHours) async {
    final dayService = DaysService();
    DateTime planDate = DateTime(date.year, date.month, date.day);
    //DateTime testDate = DateTime(2025, 7, 14);

    // Check day existing
    final existingDay = await dayService.findDayByDate(planDate);
    if (existingDay != null) {
      return;
    }

    final Day day = Day()..date = planDate;

    // Generate and fill plans, goals, tasks, etc...
    final List<Plan> morningPlans = morningHours.expand((hour) {
      final hourSole = hour.split(':')[0].padLeft(2, '0');
      return [
        Plan()
          ..plan = ''
          ..hour = hour
          ..timePassed = false
          ..period = kMorning
          ..isHourEditable = false,
        Plan()
          ..plan = ''
          ..hour = '$hourSole:'
          ..timePassed = false
          ..period = kMorning
          ..isHourEditable = true
      ];
    }).toList();

    final List<Plan> eveningPlans = eveningHours.expand((hour) {
      final hourSole = hour.split(':')[0].padLeft(2, '0');
      return [
        Plan()
          ..plan = ''
          ..hour = hour
          ..timePassed = false
          ..period = kEvening
          ..isHourEditable = false,
        Plan()
          ..plan = ''
          ..hour = '$hourSole:'
          ..timePassed = false
          ..period = kEvening
          ..isHourEditable = true
      ];
    }).toList();

    final List<Goal> goals = List.generate(
        5,
        (_) => Goal()
          ..name = ''
          ..isDone = false);

    final List<Task> tasks = List.generate(
        5,
        (_) => Task()
          ..name = ''
          ..isDone = false);

    final List<Reminder> reminders =
        List.generate(5, (_) => Reminder()..name = '');
    final List<ToCall> toCalls = List.generate(5, (_) => ToCall()..name = '');

    // Add the objects to db first
    await isar.writeTxn(() async {
      await isar.plans.putAll(morningPlans);
      await isar.plans.putAll(eveningPlans);
      await isar.goals.putAll(goals);
      await isar.tasks.putAll(tasks);
      await isar.reminders.putAll(reminders);
      await isar.toCalls.putAll(toCalls);

      // Save the day
      await isar.days.put(day);

      // Make the links
      day.plans.addAll(morningPlans);
      day.plans.addAll(eveningPlans);
      day.goals.addAll(goals);
      day.tasks.addAll(tasks);
      day.reminders.addAll(reminders);
      day.tocalls.addAll(toCalls);

      // Save the isar links
      await day.plans.save();
      await day.goals.save();
      await day.tasks.save();
      await day.reminders.save();
      await day.tocalls.save();
    });
  }

  Future<String> getAppVersion() async {
    final info = await PackageInfo.fromPlatform();
    return '${info.version}';
  }
}
