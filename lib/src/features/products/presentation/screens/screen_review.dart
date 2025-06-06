import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_code/src/features/products/presentation/widgets/bottomsheet_product_write_a_review.dart';
import 'package:flutter_boilerplate_code/src/helpers/widget_helper.dart';
import 'package:flutter_boilerplate_code/src/resources/app_images.dart';
import 'package:flutter_boilerplate_code/src/routes/routes.dart';

import '../widgets/product_rating_bar.dart';
import '../widgets/product_review_card.dart';

class ScreensReviews extends StatelessWidget {
  const ScreensReviews({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Rating and reviews", style: theme.textTheme.titleMedium),
        centerTitle: true,
      ),

      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Text(
                        "4.3",
                        style: theme.textTheme.displayMedium,
                      ),
                      SizedBox(height: 4),
                      Text("23 ratings",
                          style: theme.textTheme.titleSmall
                              ?.copyWith(color: Colors.grey)),
                    ],
                  ),
                ),
                const SizedBox(width: 40),

                // part 2 star labels
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: List.generate(5, (index) {
                      int filledStars = 5 - index;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                          filledStars,
                          (_) => const Icon(Icons.star,
                              size: 13, color: Colors.orange),
                        ),
                      );
                    }),
                  ),
                ),

                const SizedBox(width: 10),
                // part 3 bar graph
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Column(
                    children: [
                      buildRatingBar(0.9),
                      buildRatingBar(0.7),
                      buildRatingBar(0.4),
                      buildRatingBar(0.2),
                      buildRatingBar(0.1),
                    ],
                  ),
                ),

                const SizedBox(width: 40),

                // Part 4: Rating count
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("8", style: theme.textTheme.bodyMedium),
                      Text("11", style: theme.textTheme.bodyMedium),
                      Text("0", style: theme.textTheme.bodyMedium),
                      Text("0", style: theme.textTheme.bodyMedium),
                      Text("2", style: theme.textTheme.bodyMedium),
                    ],
                  ),
                )
              ],
            ),

            // review title section
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "8 reviews",
                    style: theme.textTheme.headlineSmall,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (bool? newValue) {},
                      ),
                      Text(
                        "With Photo",
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // the review section
            reviewCard(context),
            reviewCard(context),
            reviewCard(context),
            reviewCard(context),
          ]))
        ],
      ),

      // write a review section
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          WidgetHelper.showBottomSheet(
            content: BottomSheetProductWriteAReview(),
          );
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
