import 'package:tonnsour/models/plan.dart';
import 'package:tonnsour/models/reminder.dart';
import 'package:tonnsour/models/task.dart';
import 'package:tonnsour/models/tocall.dart';

import '../models/day.dart';
import '../models/goal.dart';

class DayDatas {
  final Day? day;
  final List<Goal> goals;
  final List<Task> tasks;
  final List<Reminder> reminders;
  final List<ToCall> toCalls;
  final List<Plan> plans;

  DayDatas({
    required this.day,
    required this.goals,
    required this.tasks,
    required this.reminders,
    required this.toCalls,
    required this.plans,
  });
}
