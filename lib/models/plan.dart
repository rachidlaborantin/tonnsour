import 'package:isar/isar.dart';
part 'plan.g.dart';

@collection
class Plan {
  Id id = Isar.autoIncrement;
  late String period;
  late String hour;
  late String plan;
  bool timePassed = false;
  bool isHourEditable = false;
}
