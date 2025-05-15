import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_code/src/resources/app_images.dart';
import 'package:flutter_boilerplate_code/src/routes/routes.dart';

class ScreensReviews extends StatelessWidget {
  const ScreensReviews({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
            child: Text(
              "Ratings&Reviews",
              style: theme.textTheme.titleLarge,
            ),
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // part 1 average rating
              Column(
                children: [
                  Text(
                    "4.3",
                    style: theme.textTheme.bodyLarge,
                  ),
                  SizedBox(height: 4),
                  Text("23 ratings"),
                ],
              ),
              const SizedBox(width: 40),

              // part 2 star labels
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: List.generate(5, (index) {
                  int filledStars = 5 - index;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      filledStars,
                      (_) => const Icon(Icons.star,
                          size: 20, color: Colors.orange),
                    ),
                  );
                }),
              ),

              const SizedBox(width: 10),
              // part 3 bar graph
              Column(
                children: [
                  _buildRatingBar(0.9),
                  _buildRatingBar(0.7),
                  _buildRatingBar(0.4),
                  _buildRatingBar(0.2),
                  _buildRatingBar(0.1),
                ],
              ),

              const SizedBox(width: 40),

              // Part 4: Rating count
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text("8"),
                  Text("11"),
                  Text("0"),
                  Text("0"),
                  Text("2"),
                ],
              )
            ],
          ),

          // review title section
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "8 reviews",
                  style: theme.textTheme.titleLarge,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (bool? newValue) {},
                    ),
                    Text(
                      "With Photo",
                      style: theme.textTheme.titleSmall,
                    ),
                  ],
                ),
              ],
            ),
          ),

          // the review section
          Container(
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
        ],
      ),

      // write a review section
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, Routes.writeReviews);
        },
        icon: const Icon(Icons.edit, size: 18),
        label: Text(
          "Write a Review",
          style: theme.textTheme.titleSmall,
        ),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
    );
  }
}

Widget _buildRatingBar(double value) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 2),
    width: 100,
    height: 15,
    child: FractionallySizedBox(
      alignment: Alignment.centerLeft,
      widthFactor: value,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    ),
  );
}
