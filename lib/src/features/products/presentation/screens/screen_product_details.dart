import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenProductDetails extends StatelessWidget {
  const ScreenProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "Summer Dress",
          style: theme.textTheme.titleSmall,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(0),
              child: Image.asset(
                'assets/images/image.png',
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),

            const SizedBox(height: 16),

            // size, color and heart section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: false,
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(16)),
                          ),
                          builder: (BuildContext context) {
                            return DraggableScrollableSheet(
                              expand: false,
                              initialChildSize: 0.3,
                              minChildSize: 0.2,
                              maxChildSize: 0.5,
                              builder: (context, scrollController) {
                                return Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: GridView.builder(
                                    controller: scrollController,
                                    itemCount: ['XL', 'XLL', 'M', 'S'].length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 12,
                                      mainAxisSpacing: 12,
                                      childAspectRatio: 2.5,
                                    ),
                                    itemBuilder: (context, index) {
                                      final size =
                                          ['XL', 'XLL', 'M', 'S'][index];
                                      return Container(
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Colors.grey.shade100,
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          size,
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("Size"),
                            Icon(Icons.keyboard_arrow_down),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 4,
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: false,
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(16)),
                          ),
                          builder: (BuildContext context) {
                            return DraggableScrollableSheet(
                              expand: false,
                              initialChildSize: 0.3,
                              minChildSize: 0.2,
                              maxChildSize: 0.5,
                              builder: (context, scrollController) {
                                return Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: GridView.builder(
                                    controller: scrollController,
                                    itemCount: [
                                      'Black',
                                      'Green',
                                      'White',
                                      'Blue'
                                    ].length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 12,
                                      mainAxisSpacing: 12,
                                      childAspectRatio:
                                          2.5, // Controls box shape
                                    ),
                                    itemBuilder: (context, index) {
                                      final size = [
                                        'Black',
                                        'Green',
                                        'White',
                                        'Blue'
                                      ][index];
                                      return Container(
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Colors.grey.shade100,
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          size,
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Color",
                              style: theme.textTheme.bodySmall,
                            ),
                            Icon(Icons.keyboard_arrow_down),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.favorite_border),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // product info section (name, brand, price, description)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left side
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Summer Dress",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          SizedBox(height: 4),
                          Text("by Sitilly",
                              style: TextStyle(
                                  color: Colors.grey[600], fontSize: 14)),
                          SizedBox(height: 4),
                          Row(
                            children: const [
                              Icon(Icons.star, color: Colors.orange, size: 16),
                              Icon(Icons.star, color: Colors.orange, size: 16),
                              Icon(Icons.star, color: Colors.orange, size: 16),
                              Icon(Icons.star, color: Colors.orange, size: 16),
                              Icon(Icons.star, color: Colors.orange, size: 16),
                              SizedBox(width: 6),
                              Text("(7)",
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 14)),
                            ],
                          ),
                        ],
                      ),

                      // Right side
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text(
                            "\$29.95",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "\$20.90",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "This lightweight and breathable summer dress is perfect for warm days. Designed with comfort and style in mind.",
                    style: TextStyle(
                        fontSize: 14, color: Colors.black87, height: 1.5),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // rating section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  child: Text(
                    "Ratings & Reviews",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // part 1 average rating
                    Column(
                      children: const [
                        Text(
                          "4.3",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
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
              ],
            ),

            // review title section
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "8 reviews",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (bool? newValue) {},
                      ),
                      const Text(
                        "With Photo",
                        style: TextStyle(fontSize: 14),
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
                                  const Text(
                                    "Jane Doe",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
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
                            const Text(
                              "May 13, 2025",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),

                        // Review Description
                        const Text(
                          "The product is really good and fits perfectly. The material is soft and comfortable to wear. Highly recommended!",
                          style: TextStyle(fontSize: 14),
                        ),

                        const SizedBox(height: 12),

                        // helpful icon part
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text(
                              "Helpful",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
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
                      backgroundImage: AssetImage('assets/images/image 2.png'),
                    ),
                  ),
                ],
              ),
            ),

            // write a review section
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.edit, size: 18),
                label: const Text(
                  "Write a Review",
                  style: TextStyle(fontSize: 14),
                ),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                  textStyle: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 120,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          color: Colors.white,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () {},
            child: const Text("Add to Cart",
                style: TextStyle(fontSize: 16, color: Colors.white)),
          ),
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
