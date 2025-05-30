import 'package:flutter/material.dart';

Widget deliveryMethodCard(BuildContext context, title, desc) {
  final theme = Theme.of(context);
  return Card(
    margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Column(
        children: [
          Text(title),
          Text(
            desc,
            style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey),
          ),
        ],
      ),
    ),
  );
}
