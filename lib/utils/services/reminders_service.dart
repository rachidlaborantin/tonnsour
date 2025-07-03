import 'package:isar/isar.dart';
import 'package:tonnsour/models/reminder.dart';
import 'package:tonnsour/models/start_isar.dart';
import 'package:tonnsour/models/task.dart';

class RemindersService {
  Future<void> addReminder(Reminder reminder) async {
    await isar.writeTxn(() async {
      await isar.reminders.put(reminder);
    });
  }

  Future<List<Reminder>> findAllReminders() async {
    return await isar.reminders.where().findAll();
  }

  Future<Reminder?> findReminderById(int id) async {
    return await isar.reminders.get(id);
  }

  Stream<List<Reminder>> watchReminders() {
    return isar.reminders.where().watch(fireImmediately: true);
  }

  Future<void> updateReminder(
      {required int reminderId, String? newName}) async {
    await isar.writeTxn(() async {
      final reminderToUpdate = await isar.reminders.get(reminderId);
      if (reminderToUpdate != null) {
        if (newName != null) reminderToUpdate.name = newName;
        await isar.reminders.put(reminderToUpdate);
      }
    });
  }

  Future<void> deleteReminder(int id) async {
    await isar.writeTxn(() async {
      await isar.reminders.delete(id);
    });
  }
}
