import 'package:flutter/material.dart';

class BottomSheetProductWriteAReview extends StatelessWidget {
  const BottomSheetProductWriteAReview({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.85, // Take 85% of screen height
      padding: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.all(16),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Center(
                            child: Text("What is your rate?",
                                style: theme.textTheme.titleMedium),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              5,
                              (index) => const Icon(
                                Icons.star_border,
                                size: 36,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          Center(
                            child: Text(
                              "Please share your opinion \n     about the product",
                              textAlign: TextAlign.center,
                              style: theme.textTheme.titleMedium,
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextField(
                            maxLines: 6,
                            decoration: InputDecoration(
                              hintText: "Write your review here...",
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.red,
                                    child: const Icon(Icons.camera_alt,
                                        color: Colors.white, size: 26),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "Add your photo",
                                    style: theme.textTheme.labelSmall,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Bottom Button
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: 343,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: () {
                    // Submit logic
                  },
                  child: Text(
                    "SEND REVIEW",
                    style: theme.textTheme.titleMedium
                        ?.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
