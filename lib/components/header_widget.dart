import 'package:flutter/material.dart';
import 'package:tonnsour/utils/constants.dart';
import 'package:intl/intl.dart';

/// This is the header showing the app infos (title, date, quote).
/// It's a part of the components
class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

DateTime todaysDate = DateTime.now();

class _HeaderWidgetState extends State<HeaderWidget> {
  String formattedDate = DateFormat('d MMMM y').format(todaysDate);

  @override
  Widget build(BuildContext context) {
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
                      color: kBlack,
                      fontFamily: 'Permanent',
                      fontSize: 15.0,
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
