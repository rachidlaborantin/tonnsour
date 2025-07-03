import 'package:isar/isar.dart';
part 'reminder.g.dart';

@collection
class Reminder {
  Id id = Isar.autoIncrement;
  late String name;
}
