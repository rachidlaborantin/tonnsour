import 'package:flutter/material.dart';
import 'package:tonnsour/utils/constants.dart';
import 'package:intl/intl.dart';

/// This is the header showing the app infos (title, date, quote).
/// It's a part of the components
class HeaderWidget extends StatefulWidget {
  final DateTime date;
  const HeaderWidget({super.key, required this.date});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String _formattedDateLabel(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = today.add(const Duration(days: 1));

    if (date.year == tomorrow.year &&
        date.month == tomorrow.month &&
        date.day == tomorrow.day) {
      return 'Tomorrow';
    }
    return DateFormat('d MMMM y').format(date);
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = _formattedDateLabel(widget.date);

    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        children: [
          //  Title and quote line
          Expanded(
            child: Column(
              children: const [
                Text(
                  'TONNSOUR',
                  style: TextStyle(
                      color: kRed,
                      fontFamily: kPoppins,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  'DAY PLANNER',
                  style: TextStyle(
                      color: kBlue,
                      fontFamily: kPoppins,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
          //  Subtitle and date line
          Expanded(
            child: Column(
              children: [
                const Text(
                  'DON\'T FORGET TO DRINK !',
                  style: TextStyle(
                      color: kRed,
                      fontFamily: 'Permanent',
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  formattedDate,
                  style: const TextStyle(
                      color: kBlue,
                      fontFamily: kPoppins,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
