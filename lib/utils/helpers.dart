import 'package:shared_preferences/shared_preferences.dart';

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
      {required String dayStartTime,
      required String dayEndTime,
      Duration step = const Duration(hours: 1)}) {
    final now = DateTime.now();
    final startParts = dayStartTime.split(':').map(int.parse).toList();
    final endParts = dayEndTime.split(':').map(int.parse).toList();

    DateTime startTime =
        DateTime(now.year, now.month, now.day, startParts[0], startParts[1]);
    DateTime endTime =
        DateTime(now.year, now.month, now.day, endParts[0], endParts[1]);

    // We pass to night
    if (endTime.isBefore(startTime)) {
      endTime = endTime.add(const Duration(days: 1));
    }

    List<String> times = [];
    while (startTime.isBefore(endTime) || startTime.isAtSameMomentAs(endTime)) {
      final formatted =
          "${startTime.hour.toString().padLeft(2, '0')}:${startTime.minute.toString().padLeft(2, '0')}";
      times.add(formatted);
      startTime = startTime.add(step);
    }

    return times;
  }

  static bool isTimePassed(String timeStr) {
    final now = DateTime.now();
    final parts = timeStr.split(':');

    if (parts.isEmpty || parts.length > 2) return true;

    final hour = int.tryParse(parts[0].padLeft(2, '0'));
    final minute = parts.length == 2 && parts[1].isNotEmpty
        ? int.tryParse(parts[1])
        : 0; // If minute is null, we take zero

    if (hour == null || minute == null) return false;

    final inputTime = DateTime(now.year, now.month, now.day, hour, minute);

    return inputTime.isBefore(now);
  }
}
