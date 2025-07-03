import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'day.dart';
import 'plan.dart';
import 'goal.dart';
import 'task.dart';
import 'reminder.dart';
import 'tocall.dart';

late Isar isar;
Future<void> StartIsar() async {
  final direction = await getApplicationDocumentsDirectory();
  isar = await Isar.open([
    DaySchema,
    PlanSchema,
    GoalSchema,
    TaskSchema,
    ReminderSchema,
    ToCallSchema
  ], directory: direction.path);
}
