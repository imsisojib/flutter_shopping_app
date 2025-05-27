import 'package:flutter/material.dart';

Widget otherInfoWidget(String title, String value, ThemeData theme) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 150,
          child: Text(
            title,
            style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: theme.textTheme.bodyMedium,
          ),
        ),
      ],
    ),
  );
}
