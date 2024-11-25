import 'package:flutter/material.dart';

class CheckboxWithText extends StatefulWidget {
  final String labelText;
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  const CheckboxWithText({
    Key? key,
    required this.labelText,
    this.initialValue = false,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CheckboxWithTextState createState() => _CheckboxWithTextState();
}

class _CheckboxWithTextState extends State<CheckboxWithText> {
  bool _isChecked = false;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.initialValue;
  }

  void _onCheckboxChanged(bool? newValue) {
    setState(() {
      _isChecked = newValue ?? false;
    });
    widget.onChanged(_isChecked);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          value: _isChecked,
          onChanged: _onCheckboxChanged,
        ),
        Text(
          widget.labelText,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
