import 'package:flutter/material.dart';

class UseCardCheckboxPart extends StatefulWidget {
  const UseCardCheckboxPart({super.key});

  @override
  State<UseCardCheckboxPart> createState() => _UseCardCheckboxPartState();
}

class _UseCardCheckboxPartState extends State<UseCardCheckboxPart> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        SizedBox(
          width: 28,
          height: 28,
          child: Checkbox(
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value!;
              });
            },
            side: BorderSide(
                color: isChecked ? Colors.black : Colors.grey, width: 2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2),
            ),
            checkColor: Colors.white,
            fillColor: MaterialStateProperty.resolveWith<Color>((states) {
              if (states.contains(MaterialState.selected)) {
                return Colors.black;
              }
              return Colors.transparent;
            }),
          ),
        ),
        Text("  Use as default payment method",
            style: theme.textTheme.bodyMedium),
      ],
    );
  }
}
