import 'package:isar/isar.dart';
import 'package:tonnsour/models/goal.dart';
import 'package:tonnsour/models/plan.dart';
import 'package:tonnsour/models/reminder.dart';
import 'package:tonnsour/models/task.dart';
import 'package:tonnsour/models/tocall.dart';
part 'day.g.dart';

@collection
class Day {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late DateTime date;

  final plans = IsarLinks<Plan>();
  final goals = IsarLinks<Goal>();
  final tasks = IsarLinks<Task>();
  final reminders = IsarLinks<Reminder>();
  final tocalls = IsarLinks<ToCall>();
}
