import 'package:flutter/material.dart';

class FiltersGridCategoryChip extends StatelessWidget {
  final String category;
  final bool selected;
  final VoidCallback onTap;

  const FiltersGridCategoryChip({
    required this.category,
    required this.selected,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? Colors.red : Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Text(
          category,
          style: TextStyle(
            fontSize: 14,
            color: selected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
