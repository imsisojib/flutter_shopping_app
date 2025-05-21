import 'package:flutter/material.dart';

class CategoryName extends StatelessWidget {
  final String title;
  const CategoryName({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45),
          child: Text(
            title,
            style: theme.textTheme.titleMedium,
          ),
        ),
        SizedBox(height: 15),
        Container(
          height: 2,
          color: Colors.grey[300],
        ),
      ],
    );
  }
}
