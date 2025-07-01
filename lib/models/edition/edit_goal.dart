import 'package:flutter/material.dart';
import 'package:tonnsour/utils/constants.dart';

/// A widget to show when user want to edit a goal
class EditGoal extends StatefulWidget {
  const EditGoal({super.key, required this.id, required this.name});
  final int id;
  final String name;

  @override
  State<EditGoal> createState() => _EditGoalState();
}

class _EditGoalState extends State<EditGoal> {
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
      margin: const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
      child: Row(
        children: [
          _GoalIdContainer(id: widget.id),
          const SizedBox(
            width: 5.0,
          ),
          EditableGoal(
            initialText: widget.name,
            onSubmitted: (newGoal) {},
          )
        ],
      ),
    );
  }
}

/// To create a line of goal which will be editable on long press
class EditableGoal extends StatefulWidget {
  final String initialText;
  final void Function(String)? onSubmitted;
  const EditableGoal({super.key, required this.initialText, this.onSubmitted});

  @override
  State<EditableGoal> createState() => _EditableGoalState();
}

class _EditableGoalState extends State<EditableGoal> {
  bool _isEditing = false;
  bool _isDone = false;
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

  void _defineAsDone() {
    setState(() {
      _isDone = !_isDone;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
        color: _isDone ? kRed : kWhite,
        fontFamily: kPoppins,
        fontSize: 15.0,
        fontWeight: FontWeight.w500,
        decoration: _isDone ? TextDecoration.lineThrough : TextDecoration.none,
        decorationThickness: 2.0);

    return GestureDetector(
        onLongPress: _startEditing,
        onDoubleTap: _defineAsDone,
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

class _GoalIdContainer extends StatelessWidget {
  const _GoalIdContainer({required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.0,
      height: 25.0,
      padding: const EdgeInsets.all(5.0),
      decoration:
          BoxDecoration(color: kRed, borderRadius: BorderRadius.circular(20.0)),
      child: Center(
        child: Text(
          id.toString(),
          style: const TextStyle(
              color: kWhite,
              fontFamily: kPoppins,
              fontSize: 16.0,
              fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}
