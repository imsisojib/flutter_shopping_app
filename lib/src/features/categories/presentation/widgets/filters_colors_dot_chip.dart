import 'package:flutter/material.dart';

class FiltersColorsDotChip extends StatelessWidget {
  final Color color;
  final bool selected;
  final VoidCallback onTap;

  const FiltersColorsDotChip({
    required this.color,
    required this.selected,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 20,
        backgroundColor: selected ? Colors.red : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(2.5),
          child: CircleAvatar(
            radius: 17,
            backgroundColor: color,
          ),
        ),
      ),
    );
  }
}
