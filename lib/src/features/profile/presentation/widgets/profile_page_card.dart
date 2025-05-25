import 'package:flutter/material.dart';

Widget profileCard(String title, String desc, BuildContext context) {
  final theme = Theme.of(context);
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.titleMedium,
                  ),
                  Text(
                    desc,
                    style: theme.textTheme.labelSmall
                        ?.copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right),
          ],
        ),
      )
    ],
  );
}
