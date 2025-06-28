import 'package:flutter/material.dart';
import 'package:tonnsour/utils/constants.dart';

class QuickTimeChooser extends StatefulWidget {
  final ValueChanged<TimeOfDay> timeSelectionListener;
  const QuickTimeChooser({super.key, required this.timeSelectionListener});

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
      title: const Text(
        'Select an hour',
        style: TextStyle(
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
              return FilterChip(
                  backgroundColor: kBlue,
                  selectedColor: kRed,
                  checkmarkColor: kWhite,
                  labelStyle: const TextStyle(
                      color: kWhite,
                      fontFamily: kPoppins,
                      fontWeight: FontWeight.w500),
                  label: Text(
                    '$hour h',
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
              return FilterChip(
                  backgroundColor: kBlue,
                  selectedColor: kRed,
                  checkmarkColor: kWhite,
                  label: Text('$minute min'),
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
              Navigator.pop(context);
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
