import 'package:flutter/material.dart';

class BottomSheetProductSort extends StatelessWidget {
  const BottomSheetProductSort({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final options = [
      'Popular',
      'Newer',
      'Customer Review',
      'Price: Lowest to high',
      'Price: Highest to low'
    ];

    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Container(
              width: 40,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Center(
                child: Text(
                  "Sort By",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          ...options.map((option) => ListTile(
                title: Text(option),
                onTap: () => Navigator.pop(context, option),
                dense: true,
              )),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
