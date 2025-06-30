import 'package:flutter/material.dart';
import 'package:tonnsour/utils/constants.dart';

class QuickTimeChooser extends StatefulWidget {
  final ValueChanged<TimeOfDay> timeSelectionListener;
  final String dialogMessage;
  const QuickTimeChooser(
      {super.key,
      required this.timeSelectionListener,
      required this.dialogMessage});

  @override
  State<QuickTimeChooser> createState() => _QuickTimeChooserState();
}

class _QuickTimeChooserState extends State<QuickTimeChooser> {
  int selectedHour = DateTime.now().hour;
  int selectedMinute = 0;

  final List<int> hours = List.generate(24, (i) => i);
  final List<int> minutes = [0, 15, 30, 45];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        widget.dialogMessage,
        style: const TextStyle(
            color: kBlue, fontFamily: kPoppins, fontWeight: FontWeight.w800),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //  Hour selection
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: hours.map((hour) {
              String hourFormatted = hour.toString().padLeft(2, '0');
              return FilterChip(
                  backgroundColor: kBlue,
                  selectedColor: kRed,
                  checkmarkColor: kWhite,
                  labelStyle: const TextStyle(
                      color: kWhite,
                      fontFamily: kPoppins,
                      fontWeight: FontWeight.w500),
                  label: Text(
                    '$hourFormatted h',
                  ),
                  selected: hour == selectedHour,
                  onSelected: (_) {
                    setState(() {
                      selectedHour = hour;
                    });
                  });
            }).toList(),
          ),

          const SizedBox(
            height: 20.0,
          ),
          //  Minutes selection
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: minutes.map((minute) {
              String minuteFormatted = minute.toString().padLeft(2, '0');
              return FilterChip(
                  backgroundColor: kBlue,
                  selectedColor: kRed,
                  checkmarkColor: kWhite,
                  label: Text('$minuteFormatted min'),
                  labelStyle: const TextStyle(
                      color: kWhite,
                      fontFamily: kPoppins,
                      fontWeight: FontWeight.w500),
                  selected: minute == selectedMinute,
                  onSelected: (_) {
                    setState(() {
                      selectedMinute = minute;
                    });
                  });
            }).toList(),
          )
        ],
      ),

      // Box actions
      actions: [
        TextButton(
            onPressed: () {
              widget.timeSelectionListener(
                  TimeOfDay(hour: selectedHour, minute: selectedMinute));
            },
            child: const Text(
              'Confirm',
              style: TextStyle(
                  color: kBlue,
                  fontFamily: kPoppins,
                  fontWeight: FontWeight.w800),
            ))
      ],
    );
  }
}
