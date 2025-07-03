import 'package:flutter/material.dart';
import 'package:tonnsour/components/customization/quick_minute_chooser.dart';

import '../../../utils/constants.dart';

/// To create a line of hour minute which will be editable on long press
class EditableHour extends StatefulWidget {
  final String initialText;
  final String fixedHour;
  final bool timePassed;
  final bool isTimeEditable;
  final void Function(String)? onSubmitted;
  const EditableHour(
      {super.key,
      required this.initialText,
      this.onSubmitted,
      required this.fixedHour,
      required this.timePassed,
      required this.isTimeEditable});

  @override
  State<EditableHour> createState() => _EditableHourState();
}

class _EditableHourState extends State<EditableHour> {
  late String _minuteText;

  @override
  void initState() {
    super.initState();
    _minuteText = widget.initialText;
  }

  void _minuteChooser() {
    if (widget.isTimeEditable) {
      showDialog(
          context: context,
          builder: (context) {
            return QuickMinuteChooser(
                minuteSelectionListener: (minute) {
                  setState(() {
                    _minuteText = minute.toString().padLeft(2, '0');
                  });
                  final fullTime =
                      "${widget.fixedHour.padLeft(2, '0')}$_minuteText";
                  widget.onSubmitted?.call(fullTime);
                  Navigator.of(context).pop();
                },
                dialogMessage: 'Select the minute');
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
      color: widget.timePassed ? kWhite : kBlue,
      fontFamily: kPoppins,
      fontSize: 18.0,
      fontWeight: FontWeight.w500,
    );
    final displayTime = "${widget.fixedHour.padLeft(2, '0')}$_minuteText";

    return GestureDetector(
        onTap: _minuteChooser,
        child: Text(
          displayTime,
          style: textStyle,
        ));
  }
}
