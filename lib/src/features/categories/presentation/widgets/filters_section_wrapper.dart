import 'package:flutter/material.dart';

class FiltersSectionWrapper extends StatelessWidget {
  final String title;
  final ThemeData theme;
  final Widget child;

  const FiltersSectionWrapper({
    required this.title,
    required this.theme,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              title,
              style: theme.textTheme.bodyMedium,
            ),
          ),
          SizedBox(height: 8),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 0),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            width: 700,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: child,
          ),
        ],
      ),
    );
  }
}
