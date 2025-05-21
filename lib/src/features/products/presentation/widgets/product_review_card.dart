import 'package:flutter/material.dart';

import '../../../../resources/app_images.dart';

Widget reviewCard(context) {
  final theme = Theme.of(context);
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      child: Stack(
        children: [
          // review card
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(left: 24, top: 12),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // name and rating
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Jane Doe",
                            style: theme.textTheme.titleMedium,
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: List.generate(5, (index) {
                              return const Icon(
                                Icons.star,
                                size: 16,
                                color: Colors.orange,
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                    // Date
                    Text(
                      "May 13, 2025",
                      style: theme.textTheme.bodySmall
                          ?.copyWith(color: Colors.grey),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // Review Description
                Text(
                  "The product is really good and fits perfectly. The material is soft and comfortable to wear. Highly recommended!",
                  style: theme.textTheme.bodySmall,
                ),

                const SizedBox(height: 12),

                // helpful icon part
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Helpful",
                      style: theme.textTheme.bodySmall
                          ?.copyWith(color: Colors.grey),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.thumb_up_alt_outlined,
                      size: 18,
                      color: Colors.grey[600],
                    ),
                  ],
                ),
              ],
            ),
          ),

          // circular profile image (overlapping top-left corner)
          Positioned(
            top: 0,
            left: 0,
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              backgroundImage: const AssetImage(AppImages.blackDress2),
            ),
          ),
        ],
      ),
    ),
  );
}
