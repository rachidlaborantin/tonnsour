import 'package:isar/isar.dart';
part 'goal.g.dart';

@collection
class Goal {
  Id id = Isar.autoIncrement;
  late String name;
  bool isDone = false;
}
