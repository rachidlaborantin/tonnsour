import 'package:flutter/material.dart';
import 'package:tonnsour/models/reminder.dart';
import 'package:tonnsour/utils/constants.dart';
import 'package:tonnsour/utils/services/reminders_service.dart';

class EditReminder extends StatefulWidget {
  const EditReminder({super.key, required this.name, required this.id});
  final int id;
  final String name;

  @override
  State<EditReminder> createState() => _EditReminderState();
}

class _EditReminderState extends State<EditReminder> {
  late String _name;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _name = widget.name;
    _controller.text = _name;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
      child: Row(
        children: [
          // The empty circle
          Container(
            width: 15.0,
            height: 15.0,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2, color: kWhite)),
          ),
          const SizedBox(
            width: 10.0,
          ),
          // The reminder text
          EditableReminder(
            initialText: widget.name,
            onSubmitted: (newReminder) {
              RemindersService()
                  .updateReminder(reminderId: widget.id, newName: newReminder);
            },
          )
        ],
      ),
    );
  }
}

/// To create a line of reminder which will be editable on long press
class EditableReminder extends StatefulWidget {
  final String initialText;
  final void Function(String)? onSubmitted;
  const EditableReminder(
      {super.key, required this.initialText, this.onSubmitted});

  @override
  State<EditableReminder> createState() => _EditableReminderState();
}

class _EditableReminderState extends State<EditableReminder> {
  bool _isEditing = false;
  late TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialText);
  }

  void _startEditing() {
    setState(() {
      _isEditing = true;
    });
    _focusNode.requestFocus();
  }

  void _submit() {
    setState(() {
      _isEditing = false;
    });
    widget.onSubmitted?.call(_controller.text);
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
        color: kWhite,
        fontFamily: kPoppins,
        fontSize: 15.0,
        fontWeight: FontWeight.w500);

    return GestureDetector(
        onLongPress: _startEditing,
        child: _isEditing
            ? SizedBox(
                width: 250.0,
                child: TextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  onSubmitted: (_) => _submit(),
                  style: textStyle,
                  decoration: const InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: InputBorder.none),
                  autofocus: true,
                ),
              )
            : Text.rich(TextSpan(
                text: _controller.text,
                style: textStyle,
              )));
  }
}
