import 'package:flutter/material.dart';

class RatingStar extends StatelessWidget {
  final int ratingValue;
  final String rating;

  const RatingStar({
    Key? key,
    required this.ratingValue,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        ...List.generate(5, (index) {
          return Icon(
            index < ratingValue ? Icons.star : Icons.star_border,
            size: 13,
            color: index < ratingValue ? Colors.amber : Colors.grey,
          );
        }),
        SizedBox(width: 4),
        Text(
          '($rating)',
          style: theme.textTheme.labelSmall?.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
