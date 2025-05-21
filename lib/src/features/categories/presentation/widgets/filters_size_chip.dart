import 'package:flutter/material.dart';

class FiltersSizeChip extends StatelessWidget {
  final String size;
  final bool selected;
  final VoidCallback onTap;

  const FiltersSizeChip({
    required this.size,
    required this.selected,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(size),
      selected: selected,
      showCheckmark: false,
      onSelected: (_) => onTap(),
      selectedColor: Colors.red,
      backgroundColor: Colors.grey[200],
      labelStyle: TextStyle(color: selected ? Colors.white : Colors.black),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Colors.grey.shade300),
      ),
    );
  }
}
