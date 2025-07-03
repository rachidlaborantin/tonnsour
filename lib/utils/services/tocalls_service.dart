import 'package:isar/isar.dart';
import 'package:tonnsour/models/start_isar.dart';
import 'package:tonnsour/models/task.dart';
import 'package:tonnsour/models/tocall.dart';

class ToCallsService {
  Future<void> addToCall(ToCall toCall) async {
    await isar.writeTxn(() async {
      await isar.toCalls.put(toCall);
    });
  }

  Future<List<ToCall>> findAllToCalls() async {
    return await isar.toCalls.where().findAll();
  }

  Future<ToCall?> findToCallById(int id) async {
    return await isar.toCalls.get(id);
  }

  Stream<List<ToCall>> watchToCalls() {
    return isar.toCalls.where().watch(fireImmediately: true);
  }

  Future<void> updateToCalls({required int toCallId, String? newName}) async {
    await isar.writeTxn(() async {
      final toCallToUpdate = await isar.toCalls.get(toCallId);
      if (toCallToUpdate != null) {
        if (newName != null) toCallToUpdate.name = newName;
        await isar.toCalls.put(toCallToUpdate);
      }
    });
  }

  Future<void> deleteToCall(int id) async {
    await isar.writeTxn(() async {
      await isar.toCalls.delete(id);
    });
  }
}
